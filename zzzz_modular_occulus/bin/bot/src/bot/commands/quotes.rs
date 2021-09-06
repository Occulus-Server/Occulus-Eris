use rand::{rngs::StdRng, seq::SliceRandom, SeedableRng};
use serenity::{
    framework::standard::{
        macros::command,
        Args,
        CommandResult
    },
    model::prelude::*,
    prelude::*
};
use crate::bot::quotes::QuoteDatabase;

#[command]
#[sub_commands(add)]
#[only_in(guilds)]
#[description = "Gets a quote from the quote database."]
#[usage = "<keyword> or [name]!quote add <quote>"]
async fn quote(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    if args.is_empty() {
        msg.channel_id.say(&ctx.http, "Usage: `add <quote>` to add a quote, or type in keywords to attempt to search for a specific quote.").await?;
        return Ok(())
    }

    let quotes = db.get_quotes(args.rest().to_string())?;
    if quotes.is_empty() {
        msg.channel_id.say(&ctx.http, "Could not find anything similar to your query.").await?;
    } else {
        let mut rng = StdRng::from_entropy();
        let quote = quotes.choose(&mut rng).unwrap();
        let user: String;

        if let Ok(m) = msg.guild_id.unwrap().member(&ctx.http, quote.user_id).await {
            user = m.nick.unwrap_or(m.user.name);
        } else {
            user = UserId::from(quote.user_id).to_user(&ctx.http).await?.name;
        }

        let formatted_quote = format!("{} - {}",
            quote.quote,
            user
        );

        msg.channel_id.say(&ctx.http, formatted_quote).await?;
    }

    Ok(())
}

#[command]
#[only_in(guilds)]
#[description = "Adds a quote to the quote database."]
#[usage = "[name]!quote add <quote>"]
async fn add(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    if args.is_empty() {
        msg.channel_id.say(&ctx.http, "You need to say something to add a quote.").await?;
        return Ok(())
    }

    db.add_quote(*msg.author.id.as_u64(), args.rest().to_string())?;
    msg.channel_id.say(&ctx.http, "Quote successfully added.").await?;

    Ok(())
}
