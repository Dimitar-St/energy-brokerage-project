package login

import (
	"energy-brokerage/models"
	"gorm.io/gorm"
)

type Repository interface {
	GetUser(username string) (models.User, error)
}

type loginRepository struct {
	db *gorm.DB
}

func (r *loginRepository) GetUser(username string) (models.User, error) {
	user := models.User{}
	result := r.db.First(&user, "Username = ?", username)

	if result.Error != nil {
		return models.User{}, result.Error
	}

	return user, nil
}

func NewRepository(db *gorm.DB) Repository {
	return &loginRepository{db}
}
