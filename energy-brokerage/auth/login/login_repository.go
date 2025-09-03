package login

import (
	"energy-brokerage/db"
	"energy-brokerage/models"

	"gorm.io/gorm"
)

type loginRepository struct {
	db *gorm.DB
}

func (r *loginRepository) Get(data any) ([]models.User, error) {
	username := data.(*models.User).Username
	user := &models.User{}
	result := r.db.First(user, "Username = ?", username)

	if result.Error != nil {
		return []models.User{}, result.Error
	}

	return []models.User{*user}, nil
}

func (r *loginRepository) Insert(data models.User) error {
	return db.NotImplementedError
}
func (r *loginRepository) Delete(data models.User) error {
	return db.NotImplementedError
}
func (r *loginRepository) Update(data models.User) error {
	return db.NotImplementedError
}

func NewRepository(db *gorm.DB) db.Repository[models.User] {
	return &loginRepository{db}
}
