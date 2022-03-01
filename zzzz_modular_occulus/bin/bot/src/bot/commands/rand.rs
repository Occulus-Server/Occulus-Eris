use super::util::get_random_phrase;
use crate::bot::files::RandomMessages;
use rand::distributions::{Distribution, Uniform};
use rand::rngs::StdRng;
use rand::seq::SliceRandom;
use rand::SeedableRng;
use serenity::framework::standard::{macros::command, Args, CommandResult};
use serenity::model::prelude::*;
use serenity::prelude::*;
use std::fmt::Write;

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

#[command]
#[description = "Roll the dice. Try not to get snake eyes."]
async fn rtd(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    // TODO: Split die no. x pips. Display result for every die plus total.
    if args.is_empty() {
        msg.channel_id.say(&ctx.http, "Usage: rtd `<die count>d<pip count>` to roll the die. For example: `rtd 1d6` would roll one six-sided die.").await?;
        return Ok(());
    }

    if let Some(arg) = args.current() {
        let res = arg
            .split('d')
            .filter_map(|s| s.parse::<usize>().ok())
            .collect::<Vec<usize>>();

        if res.len() != 2 {
            msg.channel_id.say(&ctx.http, "Usage: rtd `<die count>d<pip count>` to roll the die. For example: `rtd 1d6` would roll one six-sided die.").await?;
            return Ok(());
        }

        let die_count = res[0];
        let pip_count = Uniform::new_inclusive(1, res[1]);
        let mut rng = StdRng::from_entropy();

        // Roll a die, map the result to a string, concatentate into a single string.
        let res = (1..=die_count)
            .map(|d| (d, pip_count.sample(&mut rng)))
            .collect::<Vec<(usize, usize)>>();

        let mut out = String::new();

        // don't wanna spam an entire channel with usize::MAX dice now, do we?
        if die_count < 11 {
            for (die, res) in res.iter() {
                out.push_str(&format!("Die {}: {}\n", die, res));
            }
        }

        out.push_str(&format!(
            "Total: {}",
            res.iter().map(|r| r.1).sum::<usize>()
        ));

        let footer_text = get_random_phrase(ctx, "sanity").await;

        msg.channel_id
            .send_message(&ctx.http, |m| {
                m.embed(|e| {
                    e.title("Roll the dice!")
                        .description(out)
                        .footer(|f| f.text(footer_text));

                    e
                });

                m
            })
            .await?;
    }

    Ok(())
}
