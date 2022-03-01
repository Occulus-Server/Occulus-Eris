use crate::bot::{
    quotes::{QuoteDatabase, QuoteResult},
    BotUserContainer,
};
use rand::{rngs::StdRng, seq::SliceRandom, SeedableRng};
use serenity::{
    framework::standard::{macros::command, Args, CommandResult},
    model::{channel::ReactionType, prelude::*},
    prelude::*,
};

#[command]
#[sub_commands(add, delete, user, maintain)]
#[only_in(guilds)]
#[description = "Gets a quote from the quote database."]
#[usage = "<keyword> or [name]!quote add <quote>"]
async fn quote(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    if args.is_empty() {
        if let Some(quote) = db.get_random_quote()?.get(0) {
            msg.channel_id
                .say(&ctx.http, quote.process(&ctx.http, msg).await?)
                .await?;
        }

        return Ok(());
    }

    let quotes = db.get_quotes(args.rest().to_string())?;
    if quotes.is_empty() {
        msg.channel_id
            .say(&ctx.http, "Could not find anything similar to your query.")
            .await?;
    } else {
        let mut rng = StdRng::from_entropy();
        let quote = quotes.choose(&mut rng).unwrap();

        msg.channel_id
            .say(&ctx.http, quote.process(&ctx.http, msg).await?)
            .await?;
    }

    Ok(())
}

#[command]
#[only_in(guilds)]
#[description = "Gets a quote from the quote database by user (username/nickname)."]
#[usage = "<user>"]
async fn user(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    if args.is_empty() {
        msg.channel_id
            .say(&ctx.http, "Usage: `user <user>` to find a quote by user.")
            .await?;
        return Ok(());
    }

    let user_query = msg
        .guild_id
        .unwrap()
        .search_members(&ctx.http, &args.rest().to_string(), None)
        .await?;
    if user_query.is_empty() {
        msg.channel_id
            .say(&ctx.http, "No user could be found by that name.")
            .await?;
        return Ok(());
    }

    let quotes = db.get_quotes_by_user(*user_query[0].user.id.as_u64())?;
    if quotes.is_empty() {
        msg.channel_id
            .say(&ctx.http, "Could not find anything similar to your query.")
            .await?;
    } else {
        let mut rng = StdRng::from_entropy();
        let quote = quotes.choose(&mut rng).unwrap();

        msg.channel_id
            .say(&ctx.http, quote.process(&ctx.http, msg).await?)
            .await?;
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

    let id: u64;
    let quote: String;

    if args.is_empty() {
        // thanks Shadz (@Shadz) for recommending this feature
        if msg.referenced_message.is_none() {
            msg.channel_id
                .say(&ctx.http, "You need to say something to add a quote.")
                .await?;
            return Ok(());
        }

        id = *msg.referenced_message.as_ref().unwrap().author.id.as_u64();
        quote = msg.referenced_message.as_ref().unwrap().content.clone();
    } else {
        id = *msg.author.id.as_u64();
        quote = args.rest().to_string();
    }

    db.add_quote(id, quote)?;
    msg.channel_id
        .say(&ctx.http, "Quote successfully added.")
        .await?;

    Ok(())
}

#[command]
#[only_in(guilds)]
#[description = "Deletes a quote. Reply to a quote with this message to delete it, if you are the user who made that quote."]
async fn delete(ctx: &Context, msg: &Message) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    let current_user = {
        let data = ctx.data.read().await;
        data.get::<BotUserContainer>().unwrap().clone()
    };

    match &msg.referenced_message {
        None => {
            msg.channel_id
                .say(&ctx.http, "You need to use this while replying to a quote.")
                .await?;
            Ok(())
        }

        Some(v) => {
            if v.author.id != current_user.id {
                msg.channel_id
                    .say(&ctx.http, "You can only use this when replying to the bot.")
                    .await?;

                return Ok(());
            }

            let member_name = match &msg.member.as_ref().unwrap().nick {
                None => msg.author.name.as_str(),
                Some(v) => v.as_str(),
            };

            if v.content.len() <= member_name.len() {
                msg.channel_id
                    .say(&ctx.http, "You're really funny, aren't you?")
                    .await?;

                return Ok(());
            }

            // but wait, that's not all!
            log::debug!("{}", member_name);
            log::debug!("{}", &v.content[v.content.len() - member_name.len()..]);
            if member_name != &v.content[v.content.len() - member_name.len()..] {
                msg.channel_id
                    .say(&ctx.http, "You can only use this on your own quotes.")
                    .await?;

                return Ok(());
            }

            log::debug!("{}", &v.content[..v.content.len() - member_name.len() - 3]);
            let quote = &v.content[..v.content.len() - member_name.len() - 3];
            log::debug!("{:?}", db.get_quotes(quote.into())?);
            let q_vec: Vec<QuoteResult> = db
                .get_quotes(quote.into())?
                .into_iter()
                .filter(|q| &q.user_id == msg.author.id.as_u64() && q.quote == quote)
                .collect();

            if q_vec.is_empty() {
                msg.channel_id
                    .say(&ctx.http, "You can only use this on your own quotes.")
                    .await?;

                return Ok(());
            }

            let quote = &q_vec[0];
            let quote_user_id = quote.user_id;
            let msg = msg
                .channel_id
                .say(
                    &ctx.http,
                    "React to this with the \u{274C} emoji to delete. (times out in 30 seconds)",
                )
                .await?;

            let reaction = msg
                .await_reaction(&ctx.shard)
                .filter(move |r| {
                    r.emoji == ReactionType::from('\u{274c}')
                        && match r.user_id {
                            None => false,
                            Some(u) => *u.as_u64() == quote_user_id,
                        }
                })
                .timeout(std::time::Duration::new(30, 0))
                .await;

            match reaction {
                Some(_) => {
                    db.delete_quote(quote.quote_id)?;
                    msg.channel_id.say(&ctx.http, "Quote deleted.").await?;
                }
                None => {
                    msg.channel_id.say(&ctx.http, "Timed out.").await?;
                }
            };

            Ok(())
        }
    }
}

#[command]
#[sub_commands(search, admin_delete)]
#[allowed_roles("Webmin")]
#[only_in(guilds)]
#[description = "Maintain quotes. Does not do anything - you must call a subcommand."]
async fn maintain(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .say(&ctx.http, "You must call a subcommand to use this command.")
        .await?;

    Ok(())
}

#[command]
#[allowed_roles("Webmin")]
#[only_in(guilds)]
#[description = "Search a quote, and get its debug information."]
async fn search(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    if args.is_empty() {
        msg.channel_id
            .say(&ctx.http, "You must type in a quote to start querying it.")
            .await?;
        return Ok(());
    }

    let quotes = db.get_quotes(args.rest().to_string())?;
    let mut result = String::from("Quotes:\n");
    quotes
        .iter()
        .for_each(|quote| result.push_str(&format!("{:?}\n", quote)));

    msg.channel_id.say(&ctx.http, result).await?;

    Ok(())
}

#[command]
#[sub_commands(delete_quote, delete_user)]
#[allowed_roles("Webmin")]
#[only_in(guilds)]
#[description = "Delete quotes/users from the quote database."]
async fn admin_delete(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .say(&ctx.http, "You must call a subcommand to use this command.")
        .await?;

    Ok(())
}

#[command]
#[aliases(quote)]
#[allowed_roles("Webmin")]
#[only_in(guilds)]
#[description = "Delete a quote by ID."]
async fn delete_quote(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    if args.is_empty() {
        msg.channel_id
            .say(&ctx.http, "You must type in an ID to delete it.")
            .await?;
        return Ok(());
    }

    db.delete_quote(args.rest().parse()?)?;

    msg.channel_id.say(&ctx.http, "Deleted quote.").await?;

    Ok(())
}

#[command]
#[aliases(user)]
#[allowed_roles("Webmin")]
#[only_in(guilds)]
#[description = "Delete a quote by user."]
async fn delete_user(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let db = {
        let data = ctx.data.read().await;
        data.get::<QuoteDatabase>().unwrap().clone()
    };

    if args.is_empty() {
        msg.channel_id.say(&ctx.http, "You must type in a user's ID to delete them. (hint: use !quote maintain search [quote] to search for user IDs as well)").await?;
        return Ok(());
    }

    db.delete_user(args.rest().parse()?)?;

    msg.channel_id.say(&ctx.http, "Deleted quote.").await?;

    Ok(())
}
