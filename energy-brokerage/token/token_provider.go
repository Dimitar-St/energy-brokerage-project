package token

import (
	"crypto/rand"
	"encoding/base64"
	"log"
	"time"

	"energy-brokerage/db"
	"energy-brokerage/models"

	"github.com/golang-jwt/jwt/v4"
	"github.com/google/uuid"
)

var JWTSecret []byte

type CustomClaims struct {
	Username string `json:"username"`
	jwt.RegisteredClaims
}

type TokenProvider struct {
	repository db.Repository[models.Token]
}

func (t *TokenProvider) GenerateJWT(username string) (string, models.Token, error) {
	exp := time.Now().Add(15 * time.Minute)
	tokenId := uuid.NewString()
	claims := CustomClaims{
		Username: username,
		RegisteredClaims: jwt.RegisteredClaims{
			ID:        tokenId,
			Issuer:    "energy-brokerage",
			Audience:  []string{"energy-brokerage-front-end"},
			ExpiresAt: jwt.NewNumericDate(exp),
			IssuedAt:  jwt.NewNumericDate(time.Now()),
		},
	}

	tokenMetadata := models.Token{
		ID:      tokenId,
		UserID:  username,
		Revoked: false,
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	JWTSecret = []byte(t.generateJWTSecret())
	tokenValue, err := token.SignedString(JWTSecret)
	return tokenValue, tokenMetadata, err
}

func (t *TokenProvider) generateJWTSecret() string {
	secret := make([]byte, 32)

	// Here err is escaped due to the rand.never returning error. Read docs for more information
	rand.Read(secret)

	return base64.URLEncoding.EncodeToString(secret)
}

func (t *TokenProvider) GenerateJWTAndSave(username string) (string, error) {
	token, metadata, err := t.GenerateJWT(username)
	if err != nil {
		return "", err
	}

	err = t.repository.Insert(metadata)
	if err != nil {
		return "", err
	}

	return token, nil
}

func (t *TokenProvider) Revoke(id string) error {
	return t.repository.Delete(models.Token{ID: id})
}

func (t *TokenProvider) IsRevoked(id string) bool {
	token, err := t.repository.Get(id)
	if err != nil {
		log.Println(err)
		return true
	}

	return token[0].Revoked
}

func NewProvider(repository db.Repository[models.Token]) TokenProvider {
	return TokenProvider{
		repository: repository,
	}
}
