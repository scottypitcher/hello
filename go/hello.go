/*
 *  "Hello world" for Go.
 *
 *  ---
 *
 *  Run with:
 *
 *    $ go run hello.go
 *
 *  Or build a binary with:
 *
 *    $ go build hello.go
 *
 *  You can also cross-compile to another OS by setting the GOOS= and GOARCH=
 *  envvars, eg.
 *
 *    $ GOOS=linux GOARCH=amd64 go build hello.go
 *
 *  You can get a list of supported GOOS/GOARCH pairs with:
 *
 *    $ go tool dist list
 *
 *  ---
 *
 *  On 64-bit Linux "go build" generates a 2.2 MB binary using Go 1.6.2.
 *  Stripping debug symbols with "strip hello" reduces this to 1.6 MB.
 *
 *  Using Go 1.9.2 is a bit of an improvement, resulting in a 1.8 MB binary
 *  with symbols, or 1.2 MB stripped using "strip hello".
 *
 *  Using Go 1.13.8, it's back up to 1.4 MB.
 *
 *  But note:
 *
 *  "Strip is not recommended by the Go Team, it may break the executable."
 *  "It is better to use go build -ldflags -s"
 *
 *  - https://stackoverflow.com/questions/30005878/avoid-debugging-information-on-golang
 */

package main

import "fmt"

func main() {
    fmt.Println("Hello world.")
}
