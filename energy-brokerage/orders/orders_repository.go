package orders

import (
	"energy-brokerage/db"
	"energy-brokerage/filter"
	"energy-brokerage/models"
	"errors"
	"net/url"

	"gorm.io/gorm"
)

type Repository interface {
	InsertOrder(order models.Order, username string) error
	GetOrders(filters url.Values) ([]models.Order, error)
	DeleteOrder(username, id string) error
	UpdateOrder(order models.Order, username string) error
}

type orderRepository struct {
	db *gorm.DB
}

func (r *orderRepository) InsertOrder(order models.Order, username string) error {
	order.UserID = username
	result := r.db.Create(&order)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func (r *orderRepository) UpdateOrder(order models.Order, username string) error {
	dbOrder := &models.Order{}

	r.db.Model(models.Order{}).Where("user_id = ? AND id = ?", username, order.ID).First(dbOrder)

	if dbOrder.ID == "" {
		return errors.New("user does not own the order")
	}

	result := r.db.Updates(order)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func (r *orderRepository) GetOrders(filters url.Values) ([]models.Order, error) {
	orders := []models.Order{}
	filter, err := filter.NewFilter(filters)
	if err != nil {
		return orders, err
	}

	query := r.db.Model(&models.Order{})
	filter.Apply(query)
	db.ApplyPagination(query, filters)

	query.Where("deleted = ?", false)

	tx := query.Find(&orders)
	if tx.Error != nil {
		return []models.Order{}, tx.Error
	}

	return orders, nil
}

func (r *orderRepository) DeleteOrder(username, id string) error {
	dbOrder := &models.Order{}

	r.db.Model(models.Order{}).Where("user_id = ? AND id = ?", username, id).First(dbOrder)

	if dbOrder.ID == "" {
		return errors.New("user does not own the order")
	}
	tx := r.db.Model(&models.Order{}).Where("deleted = ?", false).Where("ID = ?", id).Update("deleted", true)
	if tx.Error != nil {
		return tx.Error
	}
	return nil
}

func NewRepository(db *gorm.DB) Repository {
	return &orderRepository{db}

}
