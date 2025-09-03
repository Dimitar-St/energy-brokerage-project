package server

import (
	"context"
	"energy-brokerage/auth"
	"energy-brokerage/auth/login"
	"energy-brokerage/auth/logout"
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

	"energy-brokerage/token"
	"syscall"

	"github.com/gorilla/mux"
	"gorm.io/gorm"
)

type HTTPHandler interface {
	Start()
}

type server struct {
	db        *gorm.DB
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

// IMPLEMENT JWT SECRET ROTATION
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
	tokenRepository := token.NewRepository(db)

	tokenProvider := token.NewProvider(tokenRepository)

	r := mux.NewRouter()
	httpLog := &httpLogger{}

	r.Use(httpLog.log)

	r.Handle("/register", register.NewHandler(registerReposotory)).Methods("POST")
	r.Handle("/login", login.NewHandler(loginRepository, tokenProvider)).Methods("POST")
	r.Handle("/logout", auth.Middleware(logout.NewHander(tokenProvider))).Methods("GET")

	ordersRouter := r.PathPrefix("/orders").Subrouter()
	ordersRouter.Use(auth.Middleware)

	ordersRouter.Handle("", orders.NewReadHandler(orderRepostory)).Methods("GET")
	ordersRouter.Handle("", orders.NewWriteHandler(orderRepostory)).Methods("POST")
	ordersRouter.Handle("", orders.NewUpdateHandler(orderRepostory)).Methods("PUT")
	ordersRouter.Handle("/{id}", orders.NewDeleteHandler(orderRepostory)).Methods("DELETE")
	ordersRouter.Handle("/export", orders.NewExportHandler(orderRepostory)).Methods("GET")

	stdServer := &http.Server{
		Addr:         fmt.Sprintf(":%v", port),
		Handler:      corsHandler(r),
		WriteTimeout: 2 * time.Second,
		ReadTimeout:  2 * time.Second,
	}

	return &server{
		db:        db,
		router:    r,
		stdServer: stdServer,
	}
}

func corsHandler(h http.Handler) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {

		w.Header().Set("Access-Control-Allow-Origin", "http://localhost:5173")
		w.Header().Set("Access-Control-Allow-Credentials", "true")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, X-User")
		w.Header().Set("Access-Control-Expose-Headers", "X-User")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE")

		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusOK)
			return
		}
		h.ServeHTTP(w, r)
	}
}
