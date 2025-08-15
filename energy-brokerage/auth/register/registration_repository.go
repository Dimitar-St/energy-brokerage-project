package register

import (
	"energy-brokerage/models"
	"gorm.io/gorm"
)

type Repository interface {
	InsertUser(user models.User) error
}

type registerRepository struct {
	db *gorm.DB
}

func (r *registerRepository) InsertUser(user models.User) error {
	result := r.db.Create(user)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func NewRepository(db *gorm.DB) Repository {
	return &registerRepository{db}
}
