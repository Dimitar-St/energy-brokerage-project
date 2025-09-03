package login

import (
	"energy-brokerage/db"
	"energy-brokerage/models"

	"gorm.io/gorm"
)

type loginRepository struct {
	db *gorm.DB
}

func (r *loginRepository) Get(data any) ([]models.Model, error) {
	username := data.(*models.User).Username
	user := &models.User{}
	result := r.db.First(user, "Username = ?", username)

	if result.Error != nil {
		return []models.Model{}, result.Error
	}

	return []models.Model{user}, nil
}

func (r *loginRepository) Insert(data models.Model) error {
	return db.NotImplementedError
}
func (r *loginRepository) Delete(data models.Model) error {
	return db.NotImplementedError
}
func (r *loginRepository) Update(data models.Model) error {
	return db.NotImplementedError
}

func NewRepository(db *gorm.DB) db.Repository {
	return &loginRepository{db}
}
