use super::{Settings, State};
use jsonrpc_core::futures::executor;
use jsonrpc_core::{BoxFuture, Error, ErrorCode, IoHandler, Result};
use jsonrpc_derive::rpc;
use jsonrpc_tcp_server::{Server, ServerBuilder};
use serenity::{
    http::client::Http,
    prelude::{RwLock, TypeMap},
    model::id::ChannelId,
};
use std::sync::Arc;
use tokio::sync::broadcast::Sender;

// Internal RPC server
//
// The internal RPC server for the server->bot interface.
// Setting obtainment is synchronous from the async
// RwLock, hopefully this doesn't cause any issues

const INTERNAL_ERROR: ErrorCode = ErrorCode::ServerError(500);

#[rpc(server)]
pub trait Rpc {
    #[rpc(name = "stateChange")]
    fn state_change(&self, state: String) -> Result<String>;

    #[rpc(name = "stateUpdate")]
    fn state_update(&self, state: String) -> BoxFuture<Result<String>>;
}

struct BotRpcHandler {
    state_sender: Sender<State>,
    discord_http: Arc<Http>,
    bot_data: Arc<RwLock<TypeMap>>,
}

impl Rpc for BotRpcHandler {
    fn state_change(&self, state: String) -> Result<String> {
        log::info!("Received state change, attempting to update now");
        log::info!("State recieved: {}", state);
        self.state_sender
            .send(
                serde_json::from_str(&state)
                    .map_err(|_| Error::invalid_params("Malformed state"))?,
            )
            .map_err(|_| Error::new(INTERNAL_ERROR))?;
        Ok("OK".into())
    }

    fn state_update(&self, state: String) -> BoxFuture<Result<String>> {
        log::info!("Received state update, attempting to update now");
        log::info!("State recieved: {}", state);

        let state: State = serde_json::from_str(&state)
            .map_err(|_| Error::invalid_params("Malformed state"))
            .unwrap();

        let bot_settings = {
            let settings_lock = executor::block_on(self.bot_data.read());
            settings_lock
                .get::<Settings>()
                .expect("Fatal: could not read internal settings")
                .clone()
        };

        /*
        executor::block_on(
            self.discord_http.send_message(
                bot_settings.notification_channel,
                &Value::from(
                    [
                        "<@&",
                        &bot_settings.notification_group,
                        ">",
                        " ",
                        &state.status.to_string(),
                    ]
                    .join(""),
                ),
            ),
        )
        .map_err(|_| Error::new(INTERNAL_ERROR))?;
        */
        let http = self.discord_http.clone();

        Box::pin(async move {
            let id = ChannelId::from(bot_settings.notification_channel);
            let result = id
                .send_message(
                    http,
                    |m| {
                        m.content([
                            "<@&",
                            &bot_settings.notification_group.to_string(),
                            ">",
                        ]
                        .join(""));
                        m.embed(|e| {
                            e.title(&state.status.to_string())
                                .color(state.status.color());

                            e
                        });

                        m
                    }
                )
                .await;

            if result.is_err() {
                Err(Error::new(INTERNAL_ERROR))
            } else {
                Ok("OK".into())
            }
        })
    }
}

pub async fn new(
    channel: Sender<State>,
    data_map: Arc<RwLock<TypeMap>>,
    client: Arc<Http>,
) -> Server {
    let mut io = IoHandler::new();
    let rpc_handler = BotRpcHandler {
        state_sender: channel,
        discord_http: client.clone(),
        bot_data: data_map.clone(),
    };

    io.extend_with(rpc_handler.to_delegate());

    let port = {
        let data = data_map.read().await;
        data.get::<Settings>()
            .expect("Fatal: could not load internal settings")
            .bot_port
    };

    log::info!("Starting RPC server now on localhost:{}", port);
    ServerBuilder::new(io)
        .start(&["127.0.0.1", &port.to_string()].join(":").parse().unwrap())
        .unwrap()
}

pub struct BotRpcContainer;

impl serenity::prelude::TypeMapKey for BotRpcContainer {
    type Value = Server;
}
