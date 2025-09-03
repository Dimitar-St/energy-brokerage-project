package orders

import (
	"encoding/json"
	"energy-brokerage/db"
	"energy-brokerage/models"
	"energy-brokerage/response"
	"net/http"

	"github.com/google/uuid"
)

type ordersWriteHandler struct {
	repository db.Repository[models.Order]
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

	order.UserID = r.Context().Value("username").(string)
	order.ID = uuid.New().String()
	order.Deleted = false

	err = l.repository.Insert(order)
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

func NewWriteHandler(repository db.Repository[models.Order]) http.Handler {
	return ordersWriteHandler{
		repository: repository,
	}
}
