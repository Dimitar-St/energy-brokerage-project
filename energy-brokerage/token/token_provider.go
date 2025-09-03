package token

import (
	"crypto/rand"
	"encoding/base64"
	"time"

	"github.com/golang-jwt/jwt/v4"
)

var JWTSecret []byte

type CustomClaims struct {
	Username string `json:"username"`
	jwt.RegisteredClaims
}

func GenerateJWT(username string) (string, error) {
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
	JWTSecret = []byte(GenerateJWTSecret())
	return token.SignedString(JWTSecret)
}

func GenerateJWTSecret() string {
	secret := make([]byte, 32)

	// Here err is escaped due to the rand.never returning error. Read docs for more information
	rand.Read(secret)

	return base64.URLEncoding.EncodeToString(secret)
}
