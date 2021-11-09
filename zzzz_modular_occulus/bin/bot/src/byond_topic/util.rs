use std::net::{TcpStream, ToSocketAddrs};
use super::*;

pub fn send_topic<A: ToSocketAddrs>(t: Topic, addr: A) -> Result<Response, Error> {
    let conn = TcpStream::connect(addr)?;
    log::info!("Attempting to send topic now. Topic: {}", t);
    t.write_to(&conn)?;
    let response = Response::from_reader(&conn)?;
    log::info!("Got a response: {}", response);

    Ok(response)
}
