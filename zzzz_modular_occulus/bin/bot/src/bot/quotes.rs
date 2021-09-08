use super::Error;
use r2d2::Pool;
use r2d2_sqlite::rusqlite::{Connection, OptionalExtension, Params};
use r2d2_sqlite::SqliteConnectionManager;
use serenity::{
    http::client::Http,
    model::{channel::Message, id::UserId},
    prelude::TypeMapKey,
};
use std::sync::Arc;
use std::fmt;

pub struct QuoteDatabase {
    db: Pool<SqliteConnectionManager>,
}

pub struct QuoteResult {
    quote_id: usize,
    user_id: u64,
    quote: String,
}

impl fmt::Debug for QuoteResult {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{} | {} | {}", self.quote_id, self.user_id, self.quote)
    }
}

impl QuoteResult {
    pub async fn process(&self, http: &Http, msg: &Message) -> Result<String, Error> {
        let user: String;

        if let Some(id) = msg.guild_id {
            if let Ok(m) = id.member(&http, self.user_id).await {
                user = m.nick.unwrap_or(m.user.name);
            } else {
                user = UserId::from(self.user_id).to_user(&http).await?.name;
            }
        } else {
            user = UserId::from(self.user_id).to_user(&http).await?.name;
        }

        Ok(format!("{} - {}", self.quote, user))
    }
}

impl TypeMapKey for QuoteDatabase {
    type Value = Arc<QuoteDatabase>;
}

impl QuoteDatabase {
    pub fn open() -> Result<Self, Error> {
        Ok(QuoteDatabase {
            db: Pool::new(SqliteConnectionManager::file("quotes.db"))?,
        })
    }

    pub fn init() -> Result<(), Error> {
        let db = Connection::open("quotes.db")?;

        db.execute("CREATE TABLE users (user_id INTEGER PRIMARY KEY)", [])?;
        db.execute("CREATE TABLE quotes (quote_id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, quote TEXT NOT NULL, FOREIGN KEY (user_id) REFERENCES users (user_id) ON UPDATE RESTRICT ON DELETE CASCADE)", [])?;

        Ok(())
    }

    pub fn add_quote(&self, user_id: u64, mut quote: String) -> Result<(), Error> {
        let result: Option<u64> = self
            .db
            .get()?
            .query_row(
                "SELECT user_id FROM users WHERE user_id=:id",
                &[(":id", &user_id.to_string())],
                |r| r.get(0),
            )
            .optional()?;

        if result.is_none() {
            self.db.get()?.execute(
                "INSERT INTO users (user_id) VALUES (:id)",
                &[(":id", &user_id.to_string())],
            )?;
        }

        quote = quote.split('@').collect::<String>();

        self.db.get()?.execute(
            "INSERT INTO quotes (user_id, quote) VALUES (:id, :quote)",
            &[(":id", &user_id.to_string()), (":quote", &quote)],
        )?;

        Ok(())
    }

    fn get_quote_vec(&self, query: &str, params: impl Params) -> Result<Vec<QuoteResult>, Error> {
        let conn = self.db.get()?;

        let mut statement = conn.prepare(query)?;

        let rows = statement.query_map(params, |r| {
            Ok(QuoteResult {
                quote_id: r.get(0)?,
                user_id: r.get(1)?,
                quote: r.get(2)?,
            })
        })?;

        Ok(rows.map(|r| r.unwrap()).collect::<Vec<QuoteResult>>())
    }

    pub fn get_quotes(&self, quote_fragment: String) -> Result<Vec<QuoteResult>, Error> {
        self.get_quote_vec(
            "SELECT quote_id, user_id, quote FROM quotes WHERE like(:fragment, quote)",
            &[(":fragment", &format!("%{}%", quote_fragment))],
        )
    }

    pub fn get_quotes_by_user(&self, user_id: u64) -> Result<Vec<QuoteResult>, Error> {
        self.get_quote_vec(
            "SELECT quote_id, user_id, quote FROM quotes WHERE user_id = :id",
            &[(":id", &user_id.to_string())],
        )
    }

    pub fn delete_quote(&self, quote_id: usize) -> Result<(), Error> {
        self.db.get()?.execute(
            "DELETE FROM quotes WHERE quote_id = :id",
            &[(":id", &quote_id.to_string())],
        )?;

        Ok(())
    }
}
