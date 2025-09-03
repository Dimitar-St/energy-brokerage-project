package db

import (
	"energy-brokerage/models"
	"errors"
)

var NotImplementedError = errors.New("method not implemented")

type Repository[T models.Model] interface {
	Insert(data T) error
	Get(filters any) ([]T, error)
	Delete(data T) error
	Update(data T) error
}
