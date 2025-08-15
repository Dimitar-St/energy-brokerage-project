package orders

import (
	"energy-brokerage/response"
	"net/http"

	"github.com/gorilla/mux"
	"gorm.io/gorm"
)

type ordersDeleteHandler struct {
	repository Repository
}

func (l ordersDeleteHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]
	err := l.repository.DeleteOrder(id)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed to delete"},
			InternalResponse: err.Error(),
		})
		return
	}

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   map[string]string{"success": "order deleted"},
		InternalResponse: err.Error(),
	})
}

func NewDeleteHandler(db *gorm.DB) http.Handler {
	return ordersDeleteHandler{
		repository: &orderRepository{db},
	}
}
