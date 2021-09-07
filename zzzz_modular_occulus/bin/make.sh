cd bot/
cargo build --release
mv target/release/occulus-discord-bot ../
cd ../connlib
CGO_ENABLED=1 GOARCH=386 go build -o ../byond-socks.so -tags netgo -buildmode=c-shared -x ./
rm ../byond-socks.h
