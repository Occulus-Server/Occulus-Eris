use super::{quotes::QuoteDatabase, Settings};
use futures_util::future::BoxFuture;
use serde::{Deserialize, Serialize};
use serenity::{
    http::client::Http,
    model::id::{ChannelId, GuildId},
    prelude::{RwLock, TypeMap, TypeMapKey},
};
use std::collections::{HashMap, HashSet};
use std::pin::Pin;
use std::sync::Arc;
use std::time::Duration;
use tokio::spawn;
use tracing::info;

type TaskHandler = fn(TaskInfo, Arc<Http>, Arc<RwLock<TypeMap>>) -> BoxFuture<'static, ()>;

// Serializable form of tasks.
//
// In settings, this looks like:
// {
//   handler: task_handler_function_name,
//   target_channel: [target channel],
//   delay_secs: [delay in seconds],
// }
// in the active_tasks vec.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct TaskInfo {
    pub handler: String,
    pub target_channel: u64,
    pub delay_secs: usize,
}

// There should be a list in the settings that states what tasks are currently active or not
// TODO: This *could* be more modular, but that requires... something else.
pub struct TaskStorage {
    tasks: HashMap<String, TaskHandler>,
}

impl TypeMapKey for TaskStorage {
    type Value = Arc<Self>;
}

pub struct TaskScheduler {
    tasks: Arc<TaskStorage>,
    discord_http: Arc<Http>,
    bot_data: Arc<RwLock<TypeMap>>,
    active_tasks: Arc<RwLock<HashSet<String>>>,
}

impl TypeMapKey for TaskScheduler {
    type Value = Arc<Self>;
}

// something something spawn tokio threads for every loaded task and let the
// tasks do their own thing, really lazy about this tbh

impl TaskStorage {
    pub fn new() -> Self {
        let mut tasks: HashMap<String, TaskHandler> = HashMap::new();
        tasks.insert("say_random_quote".into(), say_random_quote);

        Self { tasks }
    }

    pub fn get_all_tasks(&self) -> Vec<&String> {
        self.tasks.keys().collect()
    }

    pub fn is_valid_task(&self, task: &String) -> bool {
        self.tasks.contains_key(task)
    }
}

impl TaskScheduler {
    pub fn new(
        tasks: Arc<TaskStorage>,
        discord_http: Arc<Http>,
        bot_data: Arc<RwLock<TypeMap>>,
    ) -> Self {
        Self {
            tasks,
            discord_http,
            bot_data,
            active_tasks: Arc::new(RwLock::new(HashSet::new())),
        }
    }

    pub async fn start_all(&self) {
        for task in self.tasks.get_all_tasks() {
            self.start_task(task).await;
        }
    }

    pub async fn start_task(&self, handler: &String) {
        info!("starting task {} now", handler);
        if let Some(settings) = self.bot_data.read().await.get::<Settings>() {
            for task in &settings.active_tasks {
                if handler == &task.handler {
                    {
                        if self.active_tasks.read().await.contains(handler) {
                            info!("task {} was in active tasks", handler);
                            return;
                        }
                    }

                    if let Some(func) = self.tasks.tasks.get(handler) {
                        let delay = Duration::from_secs(task.delay_secs as u64);
                        Self::spawn_inner(
                            self.discord_http.clone(),
                            self.bot_data.clone(),
                            *func,
                            task.clone(),
                            delay,
                        );
                        self.active_tasks.write().await.insert(handler.clone());
                    }
                }
            }
        }
    }

    fn spawn_inner(
        http: Arc<Http>,
        data: Arc<RwLock<TypeMap>>,
        func: TaskHandler,
        info: TaskInfo,
        delay: Duration,
    ) {
        info!("spawning tokio task now");
        tokio::spawn(async move {
            loop {
                tokio::time::sleep(delay).await;
                func(info.clone(), http.clone(), data.clone()).await;
            }
        });
    }
}

fn say_random_quote(
    info: TaskInfo,
    http: Arc<Http>,
    data: Arc<RwLock<TypeMap>>,
) -> BoxFuture<'static, ()> {
    Box::pin(async move {
        if let Some(db) = data.read().await.get::<QuoteDatabase>() {
            // silently fail otherwise
            if let Ok(quote) = db.get_random_quote() {
                let guild_id = GuildId(data.read().await.get::<Settings>().unwrap().primary_guild);
                let channel_id = ChannelId::from(info.target_channel);
                if let Ok(quote_res) = quote[0].process(&http, &Some(guild_id)).await {
                    let _ = channel_id
                        .send_message(http, |m| {
                            m.content(quote_res);

                            m
                        })
                        .await;
                }
            }
        }
    })
}
