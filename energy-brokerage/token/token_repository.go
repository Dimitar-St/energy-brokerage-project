package token

import (
	"energy-brokerage/db"
	"energy-brokerage/models"
	"gorm.io/gorm"
)

type tokenRepository struct {
	db *gorm.DB
}

func (r *tokenRepository) Insert(data models.Token) error {
	tx := r.db.Create(data)
	return tx.Error
}

func (r *tokenRepository) Get(filters any) ([]models.Token, error) {
	return []models.Token{}, db.NotImplementedError
}

func (r *tokenRepository) Delete(data models.Token) error {
	tx := r.db.Model(&models.Token{}).Where("id = ?", data.ID).Update("revoked", true)
	return tx.Error
}

func (r *tokenRepository) Update(data models.Token) error {
	return db.NotImplementedError
}

func NewRepository(db *gorm.DB) db.Repository[models.Token] {
	return &tokenRepository{db}
}
