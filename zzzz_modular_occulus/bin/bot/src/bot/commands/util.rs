use crate::bot::{files::RandomMessages, ChannelContainer, Error, Settings, State};
use crate::{byond_topic::util, topic};
use rand::rngs::StdRng;
use rand::seq::SliceRandom;
use rand::SeedableRng;
use serenity::prelude::Context;
use std::fs::File;
use std::io::Write;
use std::sync::Arc;
use std::time::Duration;
use tokio::time::timeout;

pub async fn get_random_phrase(ctx: &Context, key: &str) -> String {
    let mut rng = StdRng::from_entropy();
    let words = {
        let data = ctx.data.read().await;
        data.get::<RandomMessages>().unwrap().clone()
    };

    words.get(key).unwrap().choose(&mut rng).unwrap().to_string()
}

pub async fn get_state(ctx: &Context) -> Result<State, Error> {
    /*
    let port = {
        let data = ctx.data.read().await;
        data.get::<Settings>()
            .expect("Fatal: Could not load internal settings")
            .dream_daemon_port
    };
    */
    let port = get_settings(ctx).await?.dream_daemon_port;

    let mut channel = {
        let data = ctx.data.read().await;
        data.get::<ChannelContainer>()
            .expect("Fatal: Could not get internal channel")
            .subscribe()
    };

    let resp = util::send_topic(
        topic!("update_bot"),
        ["127.0.0.1", &port.to_string()].join(":"),
    )?;

    let state = {
        timeout(Duration::from_secs(10), channel.recv())
            .await?
            .expect("Fatal: Internal channel sent none/was closed")
    };

    Ok(state)
}

pub async fn get_settings(ctx: &Context) -> Result<Arc<Settings>, Error> {
    let data = ctx.data.read().await;
    Ok(data
        .get::<Settings>()
        .expect("Fatal: Could not load internal settings")
        .clone())
}

pub async fn set_settings(ctx: &Context, settings: Arc<Settings>) -> Result<(), Error> {
    let mut data = ctx.data.write().await;
    save_settings(settings.clone())?;
    data.insert::<Settings>(settings);

    Ok(())
}

fn save_settings(settings: Arc<Settings>) -> Result<(), Error> {
    let mut settings_file = File::create("settings.json")?;
    let settings = serde_json::to_string_pretty(&*settings)?;
    settings_file.write_all(settings.as_bytes())?;

    Ok(())
}
