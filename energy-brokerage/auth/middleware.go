package auth

import (
	"context"
	"energy-brokerage/response"
	"energy-brokerage/token"
	"fmt"
	"net/http"

	"github.com/golang-jwt/jwt/v4"
)

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
		ctx = context.WithValue(ctx, "jti", claims.ID)

		next.ServeHTTP(w, r.WithContext(ctx))
	})
}
