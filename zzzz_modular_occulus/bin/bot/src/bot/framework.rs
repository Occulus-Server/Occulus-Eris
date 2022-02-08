use super::commands::util;
use serde_json::json;
use serenity::{
    framework::standard::{
        help_commands,
        macros::{check, help, hook},
        Args, CommandGroup, CommandOptions, CommandResult, HelpOptions, Reason,
    },
    model::{
        channel::Channel,
        prelude::{Message, UserId},
    },
    prelude::*,
};
use std::collections::HashSet;

#[help]
#[lacking_role = "hide"]
async fn help(
    ctx: &Context,
    msg: &Message,
    args: Args,
    help_options: &'static HelpOptions,
    groups: &[&'static CommandGroup],
    owners: HashSet<UserId>,
) -> CommandResult {
    let _ = help_commands::with_embeds(ctx, msg, args, help_options, groups, owners).await;
    Ok(())
}

#[hook]
pub async fn after(
    ctx: &Context,
    msg: &Message,
    command_name: &str,
    command_result: CommandResult,
) {
    match command_result {
        Ok(_) => (),
        Err(why) => {
            log::error!("Error running {}: {:?}", command_name, why);
            let footer_text = util::get_random_phrase(ctx, "sanity").await;
            msg.channel_id
                .send_message(&ctx.http, |m| {
                    m.embed(|e| {
                        e.title(format!("Error running {}", command_name))
                            .description("An error occurred running the command.")
                            .field("Details", format!("`{}`", why), false)
                            .footer(|f| f.text(footer_text))
                            .colour(0xFF0000);

                        e
                    });

                    m
                })
                .await
                .unwrap();
        }
    };
}
