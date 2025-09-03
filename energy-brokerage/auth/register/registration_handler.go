package register

import (
	"energy-brokerage/db"
	"energy-brokerage/models"
	"energy-brokerage/response"
	"net/http"

	"golang.org/x/crypto/bcrypt"

	"crypto/rand"
	"encoding/base64"
	"encoding/json"
	"fmt"

	"github.com/google/uuid"
)

type registerHandler struct {
	repository db.Repository[models.User]
}

func generateSalt(size int) (string, error) {
	bytes := make([]byte, size)
	_, err := rand.Read(bytes)
	if err != nil {
		return "", fmt.Errorf("failed to generate salt: %w", err)
	}
	return base64.StdEncoding.EncodeToString(bytes), nil
}

type loginRequest struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func (h registerHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	var req loginRequest
	err := json.NewDecoder(r.Body).Decode(&req)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Fprintf(w, "Invalid JSON: %v", err)
		return
	}
	if req.Username == "" || req.Password == "" {
		response.WriteJSON(w, http.StatusBadRequest, response.Response{
			ClientResponse:   map[string]string{"error": "username and password are required"},
			InternalResponse: "",
		})
		return
	}

	salt, _ := generateSalt(16)
	passToHash := req.Password + salt
	hashed, err := bcrypt.GenerateFromPassword([]byte(passToHash), bcrypt.DefaultCost)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed to hash password"},
			InternalResponse: err.Error(),
		})
		return
	}

	newUser := models.User{
		ID:       uuid.New().String(),
		Username: req.Username,
		Password: string(hashed),
		Salt:     salt,
	}

	err = h.repository.Insert(newUser)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "could not create user"},
			InternalResponse: err.Error(),
		})
		return
	}

	response.WriteJSON(w, http.StatusCreated, response.Response{
		ClientResponse:   map[string]string{"message": "user registered"},
		InternalResponse: "",
	})
}

func NewHandler(repository db.Repository[models.User]) http.Handler {
	return registerHandler{
		repository: repository,
	}
}
