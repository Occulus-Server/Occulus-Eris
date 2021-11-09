use rust_embed::RustEmbed;
use serenity::prelude::TypeMapKey;
use std::collections::HashMap;
use std::sync::Arc;

#[derive(RustEmbed)]
#[folder = "message_selection/"]
pub struct RandomMessages;

impl RandomMessages {
    pub fn load() -> HashMap<String, Vec<String>> {
        // there's no real way to actually hook these commands via
        // attribute macros (at least, at the moment), so we're just
        // manually doing this

        let mut map: HashMap<String, Vec<String>> = HashMap::new();
        map.insert(
            "spola".into(),
            String::from_utf8_lossy(&Self::get("spola_words").unwrap().data)
                .split("\n")
                .map(|s| s.to_string())
                .collect::<Vec<String>>(),
        );
        map.insert(
            "sanity".into(),
            String::from_utf8_lossy(&Self::get("sanity_messages").unwrap().data)
                .split("\n")
                .map(|s| s.to_string())
                .collect::<Vec<String>>(),
        );

        map
    }
}

impl TypeMapKey for RandomMessages {
    type Value = Arc<HashMap<String, Vec<String>>>;
}
