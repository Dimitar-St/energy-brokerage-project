package login

import (
	"context"
	"crypto/rand"
	"encoding/base64"
	"encoding/json"
	"energy-brokerage/response"
	"fmt"
	"net/http"
	"time"

	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/crypto/bcrypt"
)

type loginHandler struct {
	repository Repository
}

type CustomClaims struct {
	Username string `json:"username"`
	jwt.RegisteredClaims
}

type loginRequest struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

var jwtSecret []byte

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

	user, err := l.repository.GetUser(req.Username)
	if err != nil {
		response.WriteJSON(w, http.StatusUnauthorized, response.Response{
			ClientResponse:   map[string]string{"error": "invalid username or password"},
			InternalResponse: err.Error(),
		})
		return
	}

	passToCompare := req.Password + user.Salt
	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(passToCompare)); err != nil {
		response.WriteJSON(w, http.StatusUnauthorized, response.Response{
			ClientResponse:   map[string]string{"error": "invalid username or password"},
			InternalResponse: err.Error(),
		})
		return
	}

	tokenString, err := generateJWT(req.Username)
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

func generateJWT(username string) (string, error) {
	exp := time.Now().Add(15 * time.Minute)
	claims := CustomClaims{
		Username: username,
		RegisteredClaims: jwt.RegisteredClaims{
			Issuer:    "energy-brokerage",
			Audience:  []string{"energy-brokerage-front-end"},
			ExpiresAt: jwt.NewNumericDate(exp),
			IssuedAt:  jwt.NewNumericDate(time.Now()),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	jwtSecret = []byte(generateJWTSecret())
	return token.SignedString(jwtSecret)
}

func generateJWTSecret() string {
	secret := make([]byte, 32)

	// Here err is escaped due to the rand.never returning error. Read docs for more information
	rand.Read(secret)

	return base64.URLEncoding.EncodeToString(secret)
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

		token := cookie.Value
		claims := &CustomClaims{}
		_, err = jwt.ParseWithClaims(token, claims, func(t *jwt.Token) (any, error) {
			if _, ok := t.Method.(*jwt.SigningMethodHMAC); !ok {
				return nil, fmt.Errorf("unexpected signing method: %v", t.Header["alg"])
			}
			return jwtSecret, nil
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

func NewHandler(repository Repository) http.Handler {
	return loginHandler{
		repository: repository,
	}
}
