package server

import (
	"energy-brokerage/auth/login"
	"energy-brokerage/auth/register"
	"energy-brokerage/db"
	"energy-brokerage/models"
	"energy-brokerage/orders"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"gorm.io/gorm"
)

type HTTPHandler interface {
	Start(port int)
}

type server struct {
	db gorm.DB
}

func (s *server) Start(port int) {
	r := mux.NewRouter()
	log.Println("Starting Server...")
	r.Handle("/register", register.New(s.db)).Methods("GET")
	r.Handle("/login", login.New(s.db)).Methods("GET")

	r.Handle("/orders", orders.NewReadHandler(s.db)).Methods("GET")
	r.Handle("/orders", orders.NewWriteHandler(s.db)).Methods("POST")
	r.Handle("/orders/{id}", orders.NewWriteHandler(s.db)).Methods("DELETE")

	log.Printf("Listening on port %v\n", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%v", port), r))
}

func Initialize() HTTPHandler {
	log.Println("Initializing Server...")
	db := db.Initialize()

	err := db.AutoMigrate(models.ActiveModels...)
	if err != nil {
		panic(err)
	}

	return &server{
		db: db,
	}
}
