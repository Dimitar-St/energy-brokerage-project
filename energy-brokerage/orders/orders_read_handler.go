package orders

import (
	"encoding/json"
	"net/http"
)

type ordersReadHandler struct {
	repository Repository
}

func writeJSON(w http.ResponseWriter, status int, v any) {
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.WriteHeader(status)
	_ = json.NewEncoder(w).Encode(v)
}

func (l ordersReadHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Passing the query params to the repository is not opitimal. Could be done via service layer
	// to segregate the logic
	orders, err := l.repository.GetOrders(r.URL.Query())
	if err != nil {
		writeJSON(w, http.StatusInternalServerError, map[string]string{"error": "fail to fetch orders"})
		return
	}

	writeJSON(w, http.StatusOK, orders)
}

func NewReadHandler(repository Repository) http.Handler {
	return ordersReadHandler{
		repository: repository,
	}
}
