package server

import (
	"log"
	"net/http"
)

type httpLogger struct{}

func (h *httpLogger) log(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Method: %v\n URL: %v\n Addr: %v\n Agent: %v\n", r.Method, r.URL.Path, r.RemoteAddr, r.UserAgent())
		next.ServeHTTP(w, r)
	})
}
