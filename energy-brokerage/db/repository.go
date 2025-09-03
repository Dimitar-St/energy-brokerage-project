package db

import (
	"energy-brokerage/models"
	"errors"
)

var NotImplementedError = errors.New("method not implemented")

type Repository interface {
	Insert(data models.Model) error
	Get(filters any) ([]models.Model, error)
	Delete(data models.Model) error
	Update(data models.Model) error
}
