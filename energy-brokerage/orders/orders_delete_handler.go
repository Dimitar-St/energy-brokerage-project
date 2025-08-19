package orders

import (
	"energy-brokerage/response"
	"net/http"

	"github.com/gorilla/mux"
)

type ordersDeleteHandler struct {
	repository Repository
}

func (l ordersDeleteHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]
	err := l.repository.DeleteOrder(r.Context().Value("username").(string), id)
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

func NewDeleteHandler(repository Repository) http.Handler {
	return ordersDeleteHandler{
		repository: repository,
	}
}
