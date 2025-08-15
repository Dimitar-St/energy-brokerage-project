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
		log.Println("Server shutting down...")
		if err := s.stdServer.Shutdown(ctx); err != nil {
			log.Fatalf("gracefull shutdown failed: %v\n", err)
		}

		close(done)
	}()

	err := s.stdServer.ListenAndServe()
	if err != nil && err != http.ErrServerClosed {
		log.Fatal(err.Error())
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

	orderRepostory := orders.NewRepository(db)
	loginRepository := login.NewRepository(db)
	registerReposotory := register.NewRepository(db)

	r := mux.NewRouter()
	httpLog := &httpLogger{}

	r.Use(httpLog.log)

	r.Handle("/register", register.NewHandler(registerReposotory)).Methods("GET")
	r.Handle("/login", login.NewHandler(loginRepository)).Methods("GET")

	r.Handle("/orders", orders.NewReadHandler(orderRepostory)).Methods("GET")
	r.Handle("/orders", orders.NewWriteHandler(orderRepostory)).Methods("POST")
	r.Handle("/orders/{id}", orders.NewWriteHandler(orderRepostory)).Methods("DELETE")

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
