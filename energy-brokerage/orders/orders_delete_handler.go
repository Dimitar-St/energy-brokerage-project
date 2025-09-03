package orders

import (
	"energy-brokerage/db"
	"energy-brokerage/models"
	"energy-brokerage/response"
	"net/http"

	"github.com/gorilla/mux"
)

type ordersDeleteHandler struct {
	repository db.Repository[models.Order]
}

func (l ordersDeleteHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]
	order := models.NewOrder()
	order.ID = id
	order.UserID = r.Context().Value("username").(string)

	err := l.repository.Delete(order)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed to delete"},
			InternalResponse: err.Error(),
		})
		return
	}

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   map[string]string{"success": "order deleted"},
		InternalResponse: "",
	})
}

func NewDeleteHandler(repository db.Repository[models.Order]) http.Handler {
	return ordersDeleteHandler{
		repository: repository,
	}
}
