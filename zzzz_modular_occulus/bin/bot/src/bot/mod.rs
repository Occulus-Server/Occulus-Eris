mod commands;
mod files;
mod framework;
pub mod quotes;
mod rpc;

use commands::{admin::*, general::*, quotes::*, rand::*};
use serenity::{
    framework::standard::{macros::group, StandardFramework},
    model::user::CurrentUser,
    prelude::*,
};
use std::sync::Arc;
use tokio::sync::broadcast::*;

pub type Error = Box<dyn std::error::Error + std::marker::Sync + std::marker::Send>;

pub struct ChannelContainer;
impl TypeMapKey for ChannelContainer {
    type Value = Sender<State>;
}

pub struct BotUserContainer;
impl TypeMapKey for BotUserContainer {
    type Value = Arc<CurrentUser>;
}

#[group]
#[commands(status, notifyme)]
#[summary = "General server commands"]
struct General;

#[group]
#[commands(spola, sanity, quote, rtd)]
#[summary = "Fun commands"]
struct Fun;

#[group]
#[commands(set_notification_channel, set_notification_group)]
#[summary = "Webmin commands"]
struct Webmin;

pub async fn new(mut settings_reader: impl std::io::Read) -> Result<Client, Error> {
    let mut settings_raw = String::new();
    settings_reader.read_to_string(&mut settings_raw)?;
    let settings: Arc<Settings> = Arc::new(serde_json::from_str(&settings_raw)?);

    let framework = StandardFramework::new()
        .configure(|c| {
            c.with_whitespace(true)
                .prefix(&[&settings.bot_name, "!"].join(""))
        })
        .help(&framework::HELP)
        .after(framework::after)
        .bucket("status", |b| b.delay(5))
        .await
        .group(&GENERAL_GROUP)
        .group(&FUN_GROUP)
        .group(&WEBMIN_GROUP);

    let discord_client = Client::builder(&settings.token)
        .framework(framework)
        .await?;

    {
        log::info!("Loading settings into client...");
        let mut data = discord_client.data.write().await;
        data.insert::<Settings>(settings.clone());
        log::info!("Settings stored into client.");
    }

    let (state_sender, _) = channel(32);
    let rpc_server = rpc::new(
        state_sender.clone(),
        discord_client.data.clone(),
        discord_client.cache_and_http.http.clone(),
    )
    .await;
    let messages = Arc::new(files::RandomMessages::load());
    let quotedb = Arc::new(quotes::QuoteDatabase::open()?);

    {
        let user = Arc::new(
            discord_client
                .cache_and_http
                .http
                .get_current_user()
                .await?,
        );
        let mut data = discord_client.data.write().await;
        data.insert::<rpc::BotRpcContainer>(rpc_server);
        data.insert::<ChannelContainer>(state_sender);
        data.insert::<files::RandomMessages>(messages);
        data.insert::<quotes::QuoteDatabase>(quotedb);
        data.insert::<BotUserContainer>(user);
    }

    Ok(discord_client)
}

#[derive(serde::Deserialize, Clone, Debug)]
pub struct State {
    pub status: Status,
    pub storyteller: String,
    pub duration: String,
    pub roaches: usize,
}

impl std::fmt::Display for State {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{}\nStoryteller: {}\nDuration: {}, Roaches: {}",
            self.status, self.storyteller, self.duration, self.roaches
        )
    }
}

#[derive(serde::Deserialize, serde::Serialize, Clone, Debug)]
pub struct Settings {
    bot_name: String,

    // only these two should really be public,
    // to avoid making functions to change these fields
    // when they're changed in the discord server
    pub notification_channel: u64,
    pub notification_group: u64,

    token: String,
    bot_port: u16,
    dream_daemon_port: u16,
}

impl Default for Settings {
    fn default() -> Self {
        Settings {
            bot_name: "roachbot".to_string(),
            notification_channel: 0,
            notification_group: 0,
            token: "REPLACE_ME".to_string(),
            bot_port: 3621,
            dream_daemon_port: 0,
        }
    }
}

/* the current implementation of State does not allow it to be cached,
 * instead it is obtained with every call for a state status function.
 * This might be inefficient; state should probably be cached to avoid
 * overloading the pipeline with excess amounts of state updates
impl TypeMapKey for State {
    type Value = Arc<Self>;
}
*/

impl TypeMapKey for Settings {
    type Value = Arc<Self>;
}

#[derive(serde_repr::Deserialize_repr, Clone, Debug)]
#[repr(u8)]
pub enum Status {
    Setup = 0,
    Lobby = 1,
    InRound = 2,
    CrewTransfer = 3,
    Restarting = 4,
}

impl Status {
    fn color(&self) -> u32 {
        match self {
            Status::Setup | Status::Lobby => 0xFFFFFF,
            Status::InRound => 0x008000,
            Status::CrewTransfer => 0xFFFF00,
            Status::Restarting => 0xFF0000,
        }
    }
}

impl std::fmt::Display for Status {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let value = match self {
            Status::Setup | Status::Lobby => "The server is about to start a new round.",
            Status::InRound => "The server is currently in a round.",
            Status::CrewTransfer => "The ship is undergoing a crew transfer.",
            Status::Restarting => "The server is currently restarting.",
        };

        write!(f, "{}", value)
    }
}
