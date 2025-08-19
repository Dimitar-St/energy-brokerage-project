package response

import (
	"encoding/json"
	"log"
	"net/http"
)

type Response struct {
	ClientResponse   any
	InternalResponse string
}

func WriteJSON(w http.ResponseWriter, status int, v Response) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)

	err := json.NewEncoder(w).Encode(&v.ClientResponse)
	if err != nil {
		log.Println(err.Error())
	}

	if v.InternalResponse != "" {
		log.Println(v.InternalResponse)
	}
}
