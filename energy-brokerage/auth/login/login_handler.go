package login

import (
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"net/http"
	"strings"
	"time"

	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type loginHandler struct {
	repository Repository
}

// Something Simple will change that later
type CustomClaims struct {
	Username string `json:"username"`
	jwt.RegisteredClaims
}

var jwtSecret []byte

func writeJSON(w http.ResponseWriter, status int, v any) {
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.WriteHeader(status)

	_ = json.NewEncoder(w).Encode(v)
}

func (l loginHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	username := r.FormValue("username")
	password := r.FormValue("password")
	if username == "" || password == "" {
		writeJSON(w, http.StatusBadRequest, map[string]string{"error": "username and password are required"})
		return
	}

	user, err := l.repository.GetUser(username)
	if err != nil {
		log.Println(err.Error())
		writeJSON(w, http.StatusUnauthorized, map[string]string{"error": "invalid username or password"})
		return
	}

	passToCompare := password + user.Salt
	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(passToCompare)); err != nil {
		log.Println(err.Error())
		writeJSON(w, http.StatusUnauthorized, map[string]string{"error": "invalid username or password"})
		return
	}

	tokenString, err := generateJWT(username)
	if err != nil {
		log.Println(err.Error())
		writeJSON(w, http.StatusInternalServerError, map[string]string{"error": "failed to create token"})
		return
	}

	writeJSON(w, http.StatusOK, map[string]string{"token": tokenString})
}

func generateJWT(username string) (string, error) {
	exp := time.Now().Add(15 * time.Minute)
	claims := CustomClaims{
		Username: username,
		RegisteredClaims: jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(exp),
			IssuedAt:  jwt.NewNumericDate(time.Now()),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString(jwtSecret)
}

func Middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		tokenStr, err := extractBearerToken(r.Header.Get("Authorization"))
		if err != nil {
			writeJSON(w, http.StatusUnauthorized, map[string]string{"error": "missing or invalid Authorization header"})
			return
		}

		claims := &CustomClaims{}
		_, err = jwt.ParseWithClaims(tokenStr, claims, func(t *jwt.Token) (interface{}, error) {
			if _, ok := t.Method.(*jwt.SigningMethodHMAC); !ok {
				return nil, fmt.Errorf("unexpected signing method: %v", t.Header["alg"])
			}
			return jwtSecret, nil
		})

		if err != nil {
			writeJSON(w, http.StatusUnauthorized, map[string]string{"error": "invalid token: " + err.Error()})
			return
		}

		r.Header.Set("X-User", claims.Username)

		next.ServeHTTP(w, r)
	})
}

func extractBearerToken(authHeader string) (string, error) {
	if authHeader == "" {
		return "", errors.New("no auth header")
	}
	parts := strings.Fields(authHeader)
	if len(parts) != 2 || !strings.EqualFold(parts[0], "Bearer") {
		return "", errors.New("invalid auth header format")
	}
	return parts[1], nil
}

func New(db gorm.DB) http.Handler {
	return loginHandler{
		repository: NewRepository(db),
	}
}
