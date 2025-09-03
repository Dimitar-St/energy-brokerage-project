package orders

import (
	"energy-brokerage/db"
	"energy-brokerage/response"
	"net/http"
)

type ordersReadHandler struct {
	repository db.Repository
}

func (l ordersReadHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Passing the query params to the repository is not opitimal. Could be done via service layer
	// to segregate the logic
	orders, err := l.repository.Get(r.URL.Query())
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "fail to fetch orders"},
			InternalResponse: err.Error(),
		})
		return
	}

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   orders,
		InternalResponse: "",
	})
}

func NewReadHandler(repository db.Repository) http.Handler {
	return ordersReadHandler{
		repository: repository,
	}
}
