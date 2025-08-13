package orders

import (
	"energy-brokerage/filter"
	"energy-brokerage/models"
	"net/url"

	"gorm.io/gorm"
)

type Repository interface {
	InsertOrder(order models.Order) error
	GetOrders(filters url.Values) ([]models.Order, error)
	DeleteOrder(id string) error
}

type orderRepository struct {
	db gorm.DB
}

func (r *orderRepository) InsertOrder(order models.Order) error {
	result := r.db.Create(&order)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func (r *orderRepository) GetOrders(filters url.Values) ([]models.Order, error) {
	orders := []models.Order{}
	appliedFilter, err := filter.NewFilter(filters)
	if err != nil {
		return orders, err
	}

	query := r.db.Model(&models.Order{})
	appliedFilter.Apply(query)

	tx := query.Find(&orders)
	if tx.Error != nil {
		return []models.Order{}, tx.Error
	}

	return orders, nil
}

func (r *orderRepository) DeleteOrder(id string) error {
	tx := r.db.Model(&models.Order{}).Where("deleted = ?", false).Where("ID = ?", false, id).Update("deleted", true)
	if tx.Error != nil {
		return tx.Error
	}
	return nil
}

func NewRepository(db gorm.DB) Repository {
	return &orderRepository{db}

}
