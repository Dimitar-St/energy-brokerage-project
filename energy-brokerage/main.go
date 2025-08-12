package main

import (
	"energy-brokerage/server"
)

func main() {
	server := server.Initialize()

	server.Start(8080)
}
