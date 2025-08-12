package orders

import (
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
		writeJSON(w, http.StatusInternalServerError, map[string]string{"error": "failed to delete"})
		return
	}

	writeJSON(w, http.StatusOK, map[string]string{"success": "order deleted"})
}

func NewDeleteHandler(db gorm.DB) http.Handler {
	return ordersDeleteHandler{
		repository: &orderRepository{db},
	}
}
