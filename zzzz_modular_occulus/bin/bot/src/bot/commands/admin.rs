use super::tasks::{add_task as add_task_internal, remove_task as remove_task_internal};
use super::util::{get_settings, set_settings};
use serenity::framework::standard::{macros::command, Args, CommandResult};
use serenity::model::prelude::*;
use serenity::prelude::*;
use std::sync::Arc;

#[command]
#[description = "Add a task to this specific channel. A certain task can only be active once in the entire guild."]
#[only_in(guilds)]
#[allowed_roles("Webmin")]
async fn add_task(ctx: &Context, msg: &Message, mut args: Args) -> CommandResult {
    let task = match args.current() {
        Some(task) => task.to_string(),
        None => {
            return Err("Malformed arguments.".into());
        }
    };

    args.advance();
    let delay: usize = args.parse()?;

    add_task_internal(ctx, task.clone(), *msg.channel_id.as_u64(), delay).await?;

    msg.channel_id
        .say(&ctx.http, format!("Added task {}.", task))
        .await?;

    Ok(())
}

#[command]
#[description = "Removes a task from active use."]
#[only_in(guilds)]
#[allowed_roles("Webmin")]
async fn remove_task(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let task = match args.current() {
        Some(task) => task.to_string(),
        None => {
            return Err("Malformed arguments.".into());
        }
    };

    remove_task_internal(ctx, task.clone()).await?;

    msg.channel_id
        .say(&ctx.http, format!("Removed task {}.", task))
        .await?;

    Ok(())
}

#[command]
#[description = "Set the primary guild in which tasks are executed."]
#[only_in(guilds)]
#[allowed_roles("Webmin")]
async fn set_primary_guild(ctx: &Context, msg: &Message) -> CommandResult {
    let mut settings = get_settings(ctx).await?;
    let mut settings_cloned = Arc::make_mut(&mut settings);
    if let Some(id) = msg.guild_id {
        settings_cloned.primary_guild = *id.as_u64();

        set_settings(ctx, Arc::new(settings_cloned.clone())).await?;

        msg.channel_id
            .say(&ctx.http, "Set primary guild to this guild.")
            .await?;

        Ok(())
    } else {
        Err("Cannot set guild in this context.".into())
    }
}

#[command]
#[description = "Set the channel to send general bot notifications to."]
#[only_in(guilds)]
#[allowed_roles("Webmin")]
async fn set_notification_channel(ctx: &Context, msg: &Message) -> CommandResult {
    let mut settings = get_settings(ctx).await?;
    let mut settings_cloned = Arc::make_mut(&mut settings);
    settings_cloned.notification_channel = *msg.channel_id.as_u64();

    set_settings(ctx, Arc::new(settings_cloned.clone())).await?;

    msg.channel_id
        .say(&ctx.http, "Set notification channel to this channel.")
        .await?;

    Ok(())
}

#[command]
#[description = "Set the group to send general bot notifications to."]
#[only_in(guilds)]
#[allowed_roles("Webmin")]
async fn set_notification_group(ctx: &Context, msg: &Message) -> CommandResult {
    if !msg.mention_roles.is_empty() {
        let mut settings = get_settings(ctx).await?;
        let mut settings_cloned = Arc::make_mut(&mut settings);

        settings_cloned.notification_group = *msg.mention_roles[0].as_u64();

        set_settings(ctx, Arc::new(settings_cloned.clone())).await?;

        msg.channel_id
            .say(&ctx.http, "Set notification group to this role.")
            .await?;
    } else {
        msg.channel_id
            .say(
                &ctx.http,
                "You must mention a role to set it as the notification group.",
            )
            .await?;
    }

    Ok(())
}
