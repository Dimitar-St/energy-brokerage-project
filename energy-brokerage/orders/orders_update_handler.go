package orders

import (
	"encoding/json"
	"energy-brokerage/models"
	"energy-brokerage/response"
	"net/http"
)

type ordersUpdateHandler struct {
	repository Repository
}

func (l ordersUpdateHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	order := models.NewOrder()
	err := json.NewDecoder(r.Body).Decode(&order)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed to parse order"},
			InternalResponse: err.Error(),
		})
		return
	}

	err = l.repository.UpdateOrder(order, r.Context().Value("username").(string))
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed update order"},
			InternalResponse: err.Error(),
		})
		return
	}

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   map[string]string{"success": "order updated"},
		InternalResponse: "",
	})
}

func NewUpdateHandler(repository Repository) http.Handler {
	return ordersUpdateHandler{
		repository: repository,
	}
}
