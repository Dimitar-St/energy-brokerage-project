package register

import (
	"energy-brokerage/models"
	"energy-brokerage/response"
	"net/http"

	"golang.org/x/crypto/bcrypt"

	"crypto/rand"
	"encoding/base64"
	"fmt"

	"github.com/google/uuid"
)

type registerHandler struct {
	repository Repository
}

func generateSalt(size int) (string, error) {
	bytes := make([]byte, size)
	_, err := rand.Read(bytes)
	if err != nil {
		return "", fmt.Errorf("failed to generate salt: %w", err)
	}
	return base64.StdEncoding.EncodeToString(bytes), nil
}

func (h registerHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	username := r.FormValue("username")
	password := r.FormValue("password")
	if username == "" || password == "" {
		response.WriteJSON(w, http.StatusBadRequest, response.Response{
			ClientResponse:   map[string]string{"error": "username and password are required"},
			InternalResponse: "",
		})
		return
	}

	salt, _ := generateSalt(16)
	passToHash := password + salt
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
		Username: username,
		Password: string(hashed),
		Salt:     salt,
	}

	err = h.repository.InsertUser(newUser)
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

func NewHandler(repository Repository) http.Handler {
	return registerHandler{
		repository: repository,
	}
}
