use serenity::{
    framework::standard::{
        macros::{check, command},
        Args, CommandOptions, CommandResult, Reason
    },
    model::prelude::*,
    prelude::*
};
use super::util::*;
use crate::bot::Settings;

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
    let botname = {
        let data = ctx.data.read().await;
        data.get::<Settings>().clone().unwrap().bot_name.clone()
    };
    let channel = msg.channel_id.to_channel(ctx.http.clone()).await;

    match channel {
        Ok(channel) => match channel {
            Channel::Guild(channel) => {
                if let Some(t) = channel.topic {
                    if t.contains(&format!("{}#status", &botname)) {
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
#[only_in(guilds)]
#[description = "Toggles bot notifications for you."]
#[aliases(togglenotif, notifyme)]
async fn toggle_notifications(ctx: &Context, msg: &Message) -> CommandResult {
    let notif_group = {
        let data = ctx.data.read().await;
        RoleId::from(data.get::<Settings>().unwrap().notification_group)
    };
    let mut roles = msg.member.as_ref().unwrap().roles.clone();

    if roles.contains(&notif_group) {
        roles = roles.into_iter()
            .filter(|v| *v != notif_group)
            .collect::<Vec<RoleId>>();
    } else {
        roles.push(notif_group);
    }

    msg.guild_id.unwrap().edit_member(
        &ctx.http.clone(),
        &msg.member.as_ref().unwrap().user.as_ref().unwrap().id,
        |m| m.roles(roles))
        .await?;

    Ok(())
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
