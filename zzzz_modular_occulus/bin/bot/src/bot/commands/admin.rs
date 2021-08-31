use super::util::{get_settings, set_settings};
use serenity::framework::standard::{macros::command, CommandResult};
use serenity::model::prelude::*;
use serenity::prelude::*;
use std::sync::Arc;

#[command]
#[description = "Set the channel to send general bot notifications to."]
#[only_in(guilds)]
#[allowed_roles("Webmin")]
async fn set_notification_channel(ctx: &Context, msg: &Message) -> CommandResult {
    let mut settings = get_settings(ctx).await?;
    let mut settings_cloned = Arc::make_mut(&mut settings);
    settings_cloned.notification_channel = *msg.channel_id.as_u64();

    set_settings(ctx, Arc::new(settings_cloned.clone())).await?;

    msg.channel_id.say(&ctx.http, "Set notification channel to this channel.").await?;

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

        settings_cloned.notification_group = msg.mention_roles[0].to_string();

        set_settings(ctx, Arc::new(settings_cloned.clone())).await?;

        msg.channel_id.say(&ctx.http, "Set notification group to this role.").await?;
    } else {
        msg.channel_id.say(&ctx.http, "You must mention a role to set it as the notification group.").await?;
    }

    Ok(())
}
