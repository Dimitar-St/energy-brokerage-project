package orders

import (
	"encoding/json"
	"energy-brokerage/db"
	"energy-brokerage/models"
	"energy-brokerage/response"
	"net/http"
)

type ordersUpdateHandler struct {
	repository db.Repository
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

	order.UserID = r.Context().Value("username").(string)

	err = l.repository.Update(&order)
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

func NewUpdateHandler(repository db.Repository) http.Handler {
	return ordersUpdateHandler{
		repository: repository,
	}
}
