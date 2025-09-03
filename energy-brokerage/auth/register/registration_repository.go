package register

import (
	"energy-brokerage/db"
	"energy-brokerage/models"

	"gorm.io/gorm"
)

type registerRepository struct {
	db *gorm.DB
}

func (r *registerRepository) Insert(user models.User) error {
	result := r.db.Create(user)

	return result.Error
}

func (r *registerRepository) Get(data any) ([]models.User, error) {
	return []models.User{}, db.NotImplementedError
}

func (r *registerRepository) Delete(data models.User) error {
	return db.NotImplementedError
}

func (r *registerRepository) Update(data models.User) error {
	return db.NotImplementedError
}

func NewRepository(db *gorm.DB) db.Repository[models.User] {
	return &registerRepository{db}
}
