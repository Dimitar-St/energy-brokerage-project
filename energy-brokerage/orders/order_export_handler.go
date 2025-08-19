package orders

import (
	"energy-brokerage/response"
	"net/http"

	"encoding/csv"
)

type ordersExportHandler struct {
	repository Repository
}

func (l ordersExportHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	orders, err := l.repository.GetOrders(r.URL.Query())
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "fail to export orders"},
			InternalResponse: err.Error(),
		})
		return
	}

	csvWriter := csv.NewWriter(w)
	data := [][]string{}

	columns := []string{"Type", "DeliveryTime", "Amount", "Price", "Status"}
	data = append(data, columns)

	for _, order := range orders {
		row := []string{order.Type, order.DeliveryTime.String(), string(order.Amount), string(order.Price), order.Status.String()}

		data = append(data, row)
	}

	csvWriter.WriteAll(data)

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   "",
		InternalResponse: "",
	})
}

func NewExportHandler(repository Repository) http.Handler {
	return ordersExportHandler{
		repository: repository,
	}
}
