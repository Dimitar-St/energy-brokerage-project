package orders

import (
	"encoding/json"
	"energy-brokerage/models"
	"net/http"

	"gorm.io/gorm"
)

type ordersWriteHandler struct {
	repository Repository
}

func (l ordersWriteHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	order := models.NewOrder()
	err := json.NewDecoder(r.Body).Decode(&order)
	if err != nil {
		writeJSON(w, http.StatusInternalServerError, map[string]string{"error": "failed to parse order"})
		return
	}

	err = l.repository.InsertOrder(order)
	if err != nil {
		writeJSON(w, http.StatusInternalServerError, map[string]string{"error": "failed save order"})
		return
	}

	writeJSON(w, http.StatusOK, map[string]string{"success": "order created"})
}

func NewWriteHandler(db gorm.DB) http.Handler {
	return ordersWriteHandler{
		repository: &orderRepository{db},
	}
}
