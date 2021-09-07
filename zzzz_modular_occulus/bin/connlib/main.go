package main

// got *really* tired of trying to debug
// the byond-extools sockets, and i don't
// want to use world/Topic() fuckery,
// so i just made my own library instead
//
// enjoy uwu

import (
	"C"

	// "fmt"
	"net"
	// "os"
	// "strconv"
	"unsafe"
)

var reserr = C.CString("ERROR")
var ressuc = C.CString("SUCCESS")

// the following is a bit much for what i actually need this to do,
// which is just send a string message to a TCP connection
// maybe somebody can figure out funky stuff to do with all
// of these abstractions...........................................

/*
// conns is a representation of all open connections,
// mapped by string.
var conns map[string]*net.TCPConn
var connID int

func init() {
	conns = make(map[string]*net.TCPConn)
}

func argsToSlice(n C.int, args *C.char) []string {
	a := (*[(1 << 29) - 1]*C.char)(unsafe.Pointer(args))[:n:n]
	s := make([]string, 0)

	for _, v := range a {
		s = append(s, C.GoString(v))
	}

	return s
}

// OpenConn opens a TCP connection,
// and stores it in the conns map. It
// returns the ID of the connection.
//
// This requires two string arguments: the IP, and the port.

//export OpenConn
func OpenConn(n C.int, args *C.char) *C.char {
	a := argsToSlice(n, args)
	if len(a) < 2 { return reserr }

	c, err := openTCP(a[0], a[1])
	if err != nil { return reserr }

	return C.CString(c)
}

func openTCP(ip, port string) (string, error) {
	addr, err := net.ResolveTCPAddr("tcp", ip + ":" + port)
	if err != nil { return "", err }

	c, err := net.DialTCP(addr.Network(), nil, addr)
	if err != nil { return "", err }

	connID++
	id := strconv.Itoa(connID)

	conns[id] = c

	return id, nil
}

// CloseConn closes a TCP connection by ID,
// deletes its map value, and renders it
// unusable. Returns ressuc if successful.

//export CloseConn
func CloseConn(n C.int, args *C.char) *C.char {
	a := argsToSlice(n, args)
	if len(a) != 1 { return reserr }

	return closeTCP(a[0])
}

func closeTCP(id string) *C.char {
	conns[id].Close()
	delete(conns, id)

	return ressuc
}

// Send sends a message to a given connection.
// The first arg must be the connection ID,
// the second arg is the message.
//
// Returns reserr on fail, otherwise ressuc.

//export Send
func Send(n C.int, args *C.char) *C.char {
	a := argsToSlice(n, args)
	if len(a) != 2 { return reserr }

	err := sendTCP(a[0], a[1])
	if err != nil { return reserr }

	return ressuc
}

func sendTCP(id, message string) error {
	_, err := conns[id].Write([]byte(message))

	return err
}

// SendAndClose sends a UTF-8 encoded string to
// the given address, and the given port, and
// closes the connection afterwards.
//
// YOU **MUST** SEND ALL ARGUMENTS TO THIS
// AS STRINGS

//export SendAndClose
func SendAndClose(n C.int, args *C.char) *C.char {
	a := argsToSlice(n, args)
	if len(a) != 3 { return reserr }

	c, err := openTCP(a[0], a[1])
	if err != nil { return reserr }

	defer closeTCP(c)

	err = sendTCP(c, a[2])
	if err != nil { return reserr }

	return ressuc
}
*/

// SendAndClose takes three arguments, ip, port, and message,
// and opens up a TCP connection, sends it over the
// connection, and closes it afterwards.
//
// If any errors occur, reserr will be returned,
// otherwise ressuc is returned.
//
// All arguments to SendAndClose must be valid C strings.

//export SendAndClose
func SendAndClose(n C.int, args *C.char) *C.char {
	a := (*[(1 << 29) - 1]*C.char)(unsafe.Pointer(args))[:n:n]
	if len(a) != 3 { return reserr }

	addr, err := net.ResolveTCPAddr("tcp", C.GoString(a[0]) + ":" + C.GoString(a[1]))
	if err != nil { return reserr }

	c, err := net.DialTCP(addr.Network(), nil, addr)
	if err != nil { return reserr }

	defer c.Close()

	_, err = c.Write([]byte(C.GoString(a[2])))
	if err != nil { return reserr }

	return ressuc
}

func main() {}
