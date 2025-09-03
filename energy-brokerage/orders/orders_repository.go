package orders

import (
	"energy-brokerage/db"
	"energy-brokerage/filter"
	"energy-brokerage/models"
	"errors"
	"net/url"

	"gorm.io/gorm"
)

type orderRepository struct {
	db *gorm.DB
}

func (r *orderRepository) Insert(order models.Order) error {
	result := r.db.Create(&order)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func (r *orderRepository) Update(order models.Order) error {
	dbOrder := &models.Order{}
	r.db.Model(models.Order{}).Where("user_id = ? AND id = ?", order.UserID, order.ID).First(dbOrder)

	if dbOrder.ID == "" {
		return errors.New("user does not own the order")
	}

	result := r.db.Updates(order)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func (r *orderRepository) Get(filters any) ([]models.Order, error) {
	filterToApply := filters.(url.Values)
	orders := []models.Order{}
	filter, err := filter.NewFilter(filterToApply)
	if err != nil {
		return []models.Order{}, err
	}

	query := r.db.Model(&models.Order{})
	filter.Apply(query)
	db.ApplyPagination(query, filterToApply)

	query.Where("deleted = ?", false)

	tx := query.Find(&orders)
	if tx.Error != nil {
		return []models.Order{}, tx.Error
	}

	return orders, nil
}

func (r *orderRepository) Delete(order models.Order) error {
	dbOrder := &models.Order{}

	r.db.Model(models.Order{}).Where("user_id = ? AND id = ?", order.UserID, order.ID).First(dbOrder)

	if dbOrder.ID == "" {
		return errors.New("user does not own the order")
	}
	tx := r.db.Model(&models.Order{}).Where("deleted = ?", false).Where("ID = ?", dbOrder.ID).Update("deleted", true)
	if tx.Error != nil {
		return tx.Error
	}
	return nil
}

func NewRepository(db *gorm.DB) db.Repository[models.Order] {
	return &orderRepository{db}

}
