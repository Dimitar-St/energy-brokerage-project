package server

import (
	"context"
	"energy-brokerage/auth/login"
	"energy-brokerage/auth/register"
	"energy-brokerage/db"
	"energy-brokerage/models"
	"energy-brokerage/orders"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"time"

	"syscall"

	"github.com/gorilla/mux"
	"gorm.io/gorm"
)

type HTTPHandler interface {
	Start()
}

type server struct {
	db        gorm.DB
	router    *mux.Router
	stdServer *http.Server
}

func (s *server) Start() {
	log.Printf("Listening on addr: %v\n", s.stdServer.Addr)

	done := make(chan bool)
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)

	go func() {
		<-quit

		ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		defer cancel()

		s.stdServer.SetKeepAlivesEnabled(false)
		if err := s.stdServer.Shutdown(ctx); err != nil {
			log.Fatalf("graceful shutdown failed: %v\n", err)
		}

		close(done)

	}()

	if err := s.stdServer.ListenAndServe(); err != nil {
		log.Fatalf("could not start server: %v\n", err)
	}

	<-done
	log.Println("Server stopped")
}

func Initialize(port int) HTTPHandler {
	log.Println("Initializing Server...")
	db := db.Initialize()

	err := db.AutoMigrate(models.ActiveModels...)
	if err != nil {
		panic(err)
	}

	r := mux.NewRouter()
	httpLog := &httpLogger{}

	r.Use(httpLog.log)

	r.Handle("/register", register.New(db)).Methods("GET")
	r.Handle("/login", login.New(db)).Methods("GET")

	r.Handle("/orders", orders.NewReadHandler(db)).Methods("GET")
	r.Handle("/orders", orders.NewWriteHandler(db)).Methods("POST")
	r.Handle("/orders/{id}", orders.NewWriteHandler(db)).Methods("DELETE")

	stdServer := &http.Server{
		Addr:         fmt.Sprintf(":%v", port),
		Handler:      r,
		WriteTimeout: 2 * time.Second,
		ReadTimeout:  2 * time.Second,
	}

	return &server{
		db:        db,
		router:    r,
		stdServer: stdServer,
	}
}
