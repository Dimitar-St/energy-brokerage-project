package orders

import (
	"encoding/json"
	"energy-brokerage/models"
	"energy-brokerage/response"
	"net/http"
)

type ordersWriteHandler struct {
	repository Repository
}

func (l ordersWriteHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	order := models.NewOrder()
	err := json.NewDecoder(r.Body).Decode(&order)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed to parse order"},
			InternalResponse: err.Error(),
		})
		return
	}

	err = l.repository.InsertOrder(order)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed save order"},
			InternalResponse: err.Error(),
		})
		return
	}

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   map[string]string{"success": "order created"},
		InternalResponse: "",
	})
}

func NewWriteHandler(repository Repository) http.Handler {
	return ordersWriteHandler{
		repository: repository,
	}
}
