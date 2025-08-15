package register

import (
	"encoding/json"
	"energy-brokerage/models"
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

func writeJSON(w http.ResponseWriter, status int, v any) {
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.WriteHeader(status)
	_ = json.NewEncoder(w).Encode(v)
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
		writeJSON(w, http.StatusBadRequest, map[string]string{"error": "username and password are required"})
		return
	}

	salt, _ := generateSalt(16)
	passToHash := password + salt
	hashed, err := bcrypt.GenerateFromPassword([]byte(passToHash), bcrypt.DefaultCost)
	if err != nil {
		writeJSON(w, http.StatusInternalServerError, map[string]string{"error": "failed to hash password"})
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
		writeJSON(w, http.StatusInternalServerError, map[string]string{"error": "could not create user"})
		return
	}

	writeJSON(w, http.StatusCreated, map[string]string{"message": "user registered"})
}

func NewHandler(repository Repository) http.Handler {
	return registerHandler{
		repository: repository,
	}
}
