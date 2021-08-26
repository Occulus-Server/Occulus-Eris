#![allow(dead_code)]

pub mod util;

// CONSTANTS //
const MAGIC_NUMBER: [u8; 2] = [0x00, 0x83];
const PADDING: [u8; 5] = [0x00; 5];
const STRING_RESPONSE: u8 = 0x06;
const FLOAT_RESPONSE: u8 = 0x2A;

// TOPIC //
#[derive(Debug)]
pub struct Topic {
    topic: Vec<u8>,
}

type Error = Box<dyn std::error::Error + std::marker::Send + std::marker::Sync>;

#[derive(Debug)]
struct TopicError(TopicErrorType);

#[derive(Debug)]
pub enum TopicErrorType {
    Malformed,
    MalformedLen,
    TooLong
}

impl std::fmt::Display for TopicError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "An error occurred creating the topic: {:?}", self.0)
    }
}
impl std::error::Error for TopicError {}

impl Topic {
    pub fn new<T>(info: T) -> Result<Self, Error>
    where
        T: Into<String>,
    {
        let mut topic: Vec<u8> = Vec::new();
        let string = info.into();
        if string.len() >= (1 << 16) - 6 {
            return Err(Box::new(TopicError(TopicErrorType::TooLong)));
        }

        topic.append(&mut MAGIC_NUMBER[..].to_vec());
        topic.append(&mut ((string.len() + 6) as u16).to_be_bytes().to_vec());
        topic.append(&mut PADDING[..].to_vec());
        topic.append(&mut string.as_bytes().to_vec());
        topic.push(0x00);

        Ok(Topic { topic })
    }

    // this mostly just checks if the byte slice is actually a topic
    // and if it is, wraps it around in a Vec<u8> internal to a Topic
    pub fn from_raw_bytes(bytes: &[u8]) -> Result<Self, Error> {
        if bytes[0..2] != MAGIC_NUMBER || bytes[5..10] != PADDING {
            return Err(Box::new(TopicError(TopicErrorType::Malformed)));
        }

        let len = {
            let slice = &bytes[2..4];
            (u16::from_be_bytes([slice[0], slice[1]]) - 6) as usize
        };

        if bytes[9..bytes.len() - 1].len() != len {
            return Err(Box::new(TopicError(TopicErrorType::MalformedLen)));
        }

        Ok(Topic {
            topic: bytes.to_vec(),
        })
    }

    pub fn write_to(&self, mut writer: impl std::io::Write) -> std::io::Result<usize> {
        writer.write(&self.topic)
    }
}

impl std::fmt::Display for Topic {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{}",
            String::from_utf8_lossy(&self.topic[9..self.topic.len() - 1])
        )
    }
}

#[macro_export]
macro_rules! topic {
    ($input:expr) => {
        $crate::byond_topic::Topic::new($input).unwrap(); // assumes that every topic passed into it is valid
    };
}

// TOPIC RESPONSE //
pub struct Response {
    response_type: ResponseType,
    message: Option<String>,
    number: Option<f32>
}

enum ResponseType {
    Message,
    Number
}

#[derive(Debug)]
pub struct ResponseError(ResponseErrorType);

#[derive(Debug)]
pub enum ResponseErrorType {
    Malformed,
    IncorrectType,
    IncorrectLen,
    NotAMessage,
    NotANumber
}

impl std::fmt::Display for ResponseError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "An error occurred creating the topic response: {:?}", self.0)
    }
}
impl std::error::Error for ResponseError {}

impl Response {
    pub fn from_bytes(bytes: &[u8]) -> Result<Self, Error> {
        Self::from_reader(bytes)
    }

    pub fn from_reader(mut reader: impl std::io::Read) -> Result<Self, Error> {
        let header = &mut [0u8; 5][..];
        let mut read_bytes = reader.read(header)?;
        if read_bytes != 5 {
            return Err(Box::new(ResponseError(ResponseErrorType::Malformed)));
        }

        if header[0..2] != MAGIC_NUMBER {
            return Err(Box::new(ResponseError(ResponseErrorType::Malformed)));
        }

        let response: Response;
        if header[4] == STRING_RESPONSE {
            let response_type = ResponseType::Message;
            let len = {
                let slice = &header[2..4];
                (u16::from_be_bytes([slice[0], slice[1]]) - 1) as usize
            };

            // make the largest possible buffer (16 bit max size), but slice it to the length
            // of the response message

            let body = &mut [0u8; 1 << 16][..len];
            read_bytes = reader.read(body)?;

            if read_bytes != len {
                return Err(Box::new(ResponseError(ResponseErrorType::IncorrectLen)));
            }

            let message = Some(String::from_utf8_lossy(&body[0..len - 1]).to_string());

            response = Response {
                response_type,
                message,
                number: None
            };
        } else if header[4] == FLOAT_RESPONSE {
            let response_type = ResponseType::Number;
            let mut parts = [0u8; 4];
            read_bytes = reader.read(&mut parts[..])?;

            if read_bytes != 4 {
                return Err(Box::new(ResponseError(ResponseErrorType::IncorrectLen)));
            }

            let number = Some(f32::from_le_bytes(parts));

            response = Response {
                response_type,
                number,
                message: None
            };
        } else {
            return Err(Box::new(ResponseError(ResponseErrorType::Malformed)));
        }

        Ok(response)
    }

    pub fn is_string(&self) -> bool {
        matches!(self.response_type, ResponseType::Message)
    }

    pub fn is_num(&self) -> bool {
        matches!(self.response_type, ResponseType::Number)
    }

    pub fn get_num(&self) -> Result<f32, Error> {
        if !self.is_num() {
            return Err(Box::new(ResponseError(ResponseErrorType::NotANumber)));
        }

        Ok(self.number.unwrap())
    }

    // it's much more efficient to use is_string() and to_string() to some extent,
    // but whatever floats your boat
    pub fn get_message(&self) -> Result<String, Error> {
        if !self.is_string() {
            return Err(Box::new(ResponseError(ResponseErrorType::NotAMessage)));
        }

        Ok(self.message.as_ref().unwrap().clone())
    }
}

impl std::fmt::Display for Response {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self.response_type {
            ResponseType::Message => write!(f, "{}", self.message.as_ref().unwrap()),
            ResponseType::Number => write!(f, "{}", self.number.unwrap())
        }

    }
}

// TESTS //
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[ignore]
    fn testing_be_bytes() {
        println!("{:?}", 1 << 16);
        println!("{:?}", &1024usize.to_be_bytes()[6..]);
    }

    #[test]
    fn testing_topic_crafting() {
        let topic = Topic::new("test").unwrap();
        let topic_macro = topic!("test");
        println!("{:?}", topic);
        assert_eq!("test", topic.to_string());
        assert_eq!("test", topic_macro.to_string());
    }

    #[test]
    fn testing_topic_response_decoding() {
        let response_raw = [0x00, 0x83, 0x00, 0x03, 0x06, b'A', 0x00];
        let response = Response::from_bytes(&response_raw).unwrap();
        assert_eq!("A", response.to_string());

        let response_from_reader = Response::from_reader(&response_raw[..]).unwrap();
        assert_eq!("A", response_from_reader.to_string());
    }
}
