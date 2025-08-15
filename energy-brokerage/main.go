package main

import (
	"energy-brokerage/server"
)

func main() {
	server := server.Initialize(8080)

	server.Start()
}
