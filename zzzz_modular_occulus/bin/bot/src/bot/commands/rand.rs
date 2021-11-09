use super::util::get_random_phrase;
use crate::bot::files::RandomMessages;
use rand::rngs::StdRng;
use rand::seq::SliceRandom;
use rand::SeedableRng;
use serenity::framework::standard::{macros::command, CommandResult};
use serenity::model::prelude::*;
use serenity::prelude::*;

#[command]
#[description = "Words banned by the Northern Light command board. Do you dare?"]
async fn spola(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .say(&ctx.http, get_random_phrase(ctx, "spola").await)
        .await?;

    Ok(())
}

#[command]
#[description = "Peek into the void. Hope it does not stare back."]
async fn sanity(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .say(&ctx.http, get_random_phrase(ctx, "sanity").await)
        .await?;

    Ok(())
}
