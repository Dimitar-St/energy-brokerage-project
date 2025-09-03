package login

import (
	"context"
	"encoding/json"
	"energy-brokerage/db"
	"energy-brokerage/models"
	"energy-brokerage/response"
	"energy-brokerage/token"
	"fmt"
	"net/http"

	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/crypto/bcrypt"
)

type loginHandler struct {
	repository db.Repository
}

type loginRequest struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func (l loginHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
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

	searchedUser := models.User{
		Username: req.Username,
	}
	users, err := l.repository.Get(&searchedUser)
	if err != nil {
		response.WriteJSON(w, http.StatusUnauthorized, response.Response{
			ClientResponse:   map[string]string{"error": "invalid username or password"},
			InternalResponse: err.Error(),
		})
		return
	}

	if len(users) == 0 {
		response.WriteJSON(w, http.StatusUnauthorized, response.Response{
			ClientResponse:   map[string]string{"error": "invalid username or password"},
			InternalResponse: "user does not exist",
		})
		return
	}

	foundUser, ok := users[0].(*models.User)
	if !ok {
		response.WriteJSON(w, http.StatusUnauthorized, response.Response{
			ClientResponse:   map[string]string{"error": "invalid username or password"},
			InternalResponse: "could not parse model to user",
		})
		return
	}

	passToCompare := req.Password + foundUser.Salt
	if err := bcrypt.CompareHashAndPassword([]byte(foundUser.Password), []byte(passToCompare)); err != nil {
		response.WriteJSON(w, http.StatusUnauthorized, response.Response{
			ClientResponse:   map[string]string{"error": "invalid username or password"},
			InternalResponse: err.Error(),
		})
		return
	}

	tokenString, err := token.GenerateJWT(req.Username)
	if err != nil {
		response.WriteJSON(w, http.StatusInternalServerError, response.Response{
			ClientResponse:   map[string]string{"error": "failed to create token"},
			InternalResponse: err.Error(),
		})
		return
	}

	http.SetCookie(w, &http.Cookie{
		Name:     "auth_token",
		Value:    tokenString,
		Path:     "/",
		HttpOnly: true,
		Secure:   true,
		SameSite: http.SameSiteNoneMode,
	})

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   map[string]string{"success": "logged in"},
		InternalResponse: "",
	})
}

func Middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		cookie, err := r.Cookie("auth_token")
		if err != nil {
			response.WriteJSON(w, http.StatusUnauthorized, response.Response{
				ClientResponse:   map[string]string{"error": "missing Authorization header"},
				InternalResponse: err.Error(),
			})
			return
		}

		tokenValue := cookie.Value
		claims := &token.CustomClaims{}
		_, err = jwt.ParseWithClaims(tokenValue, claims, func(t *jwt.Token) (any, error) {
			if _, ok := t.Method.(*jwt.SigningMethodHMAC); !ok {
				return nil, fmt.Errorf("unexpected signing method: %v", t.Header["alg"])
			}
			return token.JWTSecret, nil
		})

		if err != nil {
			response.WriteJSON(w, http.StatusUnauthorized, response.Response{
				ClientResponse:   map[string]string{"error": "invalid token"},
				InternalResponse: err.Error(),
			})
			return
		}

		w.Header().Set("X-User", claims.Username)

		ctx := context.WithValue(r.Context(), "username", claims.Username)

		next.ServeHTTP(w, r.WithContext(ctx))
	})
}

func NewHandler(repository db.Repository) http.Handler {
	return loginHandler{
		repository: repository,
	}
}
