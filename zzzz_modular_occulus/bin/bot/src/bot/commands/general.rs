use serenity::{
    framework::standard::{
        macros::{check, command},
        Args, CommandOptions, CommandResult, Reason
    },
    model::prelude::*,
    prelude::*
};
use super::util::*;

/*
#[command]
async fn ping(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id.say(&ctx.http, "Pong!").await?;

    Ok(())
}
*/

#[check]
#[name = "Status"]
async fn status_whitelist_check(
    ctx: &Context,
    msg: &Message,
    _: &mut Args,
    _: &CommandOptions,
) -> Result<(), Reason> {
    let channel = msg.channel_id.to_channel(ctx.http.clone()).await;

    match channel {
        Ok(channel) => match channel {
            Channel::Guild(channel) => {
                if let Some(t) = channel.topic {
                    if t.contains("roachbot#status") {
                        return Ok(());
                    } else {
                        return Err(Reason::User(String::from(
                            "Channel cannot send status messages",
                        )));
                    }
                } else {
                    return Err(Reason::User(String::from(
                        "Channel cannot send status messages",
                    )));
                }
            }
            _ => return Err(Reason::User(String::from("Channel is not within a guild"))),
        },
        Err(e) => return Err(Reason::Log(format!("could not send to channel: {:?}", e))),
    }
}

#[command]
#[checks(Status)]
#[description = "Gets the current status of the SS13 server."]
#[bucket = "status"]
async fn status(ctx: &Context, msg: &Message) -> CommandResult {
    let state = get_state(ctx).await?;
    let footer_text = get_random_phrase(ctx, "sanity").await;

    msg.channel_id.send_message(&ctx.http, |m| {
        m.embed(|e| {
            e.title(&state.status.to_string())
                .color(state.status.color())
                .description(format!("- Storyteller: {}\n- Duration: {}\n- Roaches: {}", &state.storyteller, &state.duration, state.roaches))
                .footer(|f| f.text(footer_text));

            e
        });

        m
    }).await?;

    Ok(())
}

#[command]
#[checks(Status)]
#[description = "Gets the current storyteller on the SS13 server."]
#[bucket = "status"]
async fn storyteller(ctx: &Context, msg: &Message) -> CommandResult {
    let state = get_state(ctx).await?;

    msg.channel_id.send_message(&ctx.http, |m| {
        m.content(format!("The storyteller is currently {}", state.storyteller));

        m
    }).await?;

    Ok(())
}

#[command]
#[description = "Gets the current round duration on the SS13 server."]
#[bucket = "status"]
async fn duration(ctx: &Context, msg: &Message) -> CommandResult {
    let state = get_state(ctx).await?;

    msg.channel_id.send_message(&ctx.http, |m| {
        m.content(format!("The round has lasted for {}", state.duration));

        m
    }).await?;

    Ok(())
}

#[command]
#[description = "Gets the current roach amount on the ship."]
#[bucket = "status"]
async fn roaches(ctx: &Context, msg: &Message) -> CommandResult {
    let state = get_state(ctx).await?;

    msg.channel_id.send_message(&ctx.http, |m| {
        m.content(format!("There have been a total of {} roaches.", state.roaches));

        m
    }).await?;

    Ok(())
}
