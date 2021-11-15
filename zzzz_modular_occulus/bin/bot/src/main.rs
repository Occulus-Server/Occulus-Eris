mod bot;
mod byond_topic;

use bot::{new, Settings, quotes::QuoteDatabase};
use std::fs::File;
use std::io::Write;

#[tokio::main]
async fn main() -> Result<(), bot::Error> {
    tracing_subscriber::fmt::init();

    let settings_file = File::open("settings.json").unwrap_or_else(|e| {
        if e.kind() == std::io::ErrorKind::NotFound {
            let mut file = File::create("settings.json").unwrap();
            let settings = serde_json::to_string_pretty(&Settings::default()).unwrap();
            file.write_all(settings.as_bytes()).unwrap();
            panic!("Created a settings file in the current directory. Fill in the correct details, and start the bot again.");
        } else {
            panic!("Error: {}", e);
        }
    });

    if let Err(e) = File::open("quotes.db") {
        if e.kind() == std::io::ErrorKind::NotFound {
            QuoteDatabase::init()?;
        } else {
            panic!("Error: {}", e);
        }
    }

    log::info!("Starting bot now.");
    new(settings_file).await?.start().await?;
    log::info!("Bot completed.");

    Ok(())
}
