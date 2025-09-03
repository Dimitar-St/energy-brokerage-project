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

func (r *orderRepository) Insert(order models.Model) error {
	result := r.db.Create(&order)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func (r *orderRepository) Update(order models.Model) error {
	//Not a good practice better the model itself to return it's properties without casting everytime
	orderToUpdate := order.(*models.Order)
	dbOrder := &models.Order{}
	r.db.Model(models.Order{}).Where("user_id = ? AND id = ?", orderToUpdate.UserID, orderToUpdate.ID).First(dbOrder)

	if dbOrder.ID == "" {
		return errors.New("user does not own the order")
	}

	result := r.db.Updates(order)

	if result.Error != nil {
		return result.Error
	}

	return nil
}

func (r *orderRepository) Get(filters any) ([]models.Model, error) {
	filterToApply := filters.(url.Values)
	orders := []models.Model{}
	filter, err := filter.NewFilter(filterToApply)
	if err != nil {
		return orders, err
	}

	query := r.db.Model(&models.Order{})
	filter.Apply(query)
	db.ApplyPagination(query, filterToApply)

	query.Where("deleted = ?", false)

	tx := query.Find(&orders)
	if tx.Error != nil {
		return []models.Model{}, tx.Error
	}

	return orders, nil
}

func (r *orderRepository) Delete(order models.Model) error {
	dbOrder := &models.Order{}
	orderToDelete := order.(*models.Order)

	r.db.Model(models.Order{}).Where("user_id = ? AND id = ?", orderToDelete.UserID, orderToDelete.ID).First(dbOrder)

	if dbOrder.ID == "" {
		return errors.New("user does not own the order")
	}
	tx := r.db.Model(&models.Order{}).Where("deleted = ?", false).Where("ID = ?", dbOrder.ID).Update("deleted", true)
	if tx.Error != nil {
		return tx.Error
	}
	return nil
}

func NewRepository(db *gorm.DB) db.Repository {
	return &orderRepository{db}

}
