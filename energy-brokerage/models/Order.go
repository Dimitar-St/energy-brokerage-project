package models

import (
	"time"

	"github.com/google/uuid"
)

type OrderStatus int

const (
	Active OrderStatus = iota
	Executed
	Cancelled
)

func (s OrderStatus) String() string {
	switch s {
	case Active:
		return "Active"
	case Executed:
		return "Executed"
	case Cancelled:
		return "Cancelled"
	default:
		return "Unknown"
	}
}

type Order struct {
	ID           string      `gorm:"primaryKey"`
	Type         string      `gorm:"not null" json:"type"`
	DeliveryTime time.Time   `gorm:"not null" json:"deliveryTime"`
	Amount       int         `gorm:"not null" json:"amount"`
	Price        int         `gorm:"not null" json:"price"`
	Status       OrderStatus `gorm:"not null" json:"status"`
	Deleted      bool        `gorm:"not null"`
	UserID       string      `gorm:"not null"`
}

func NewOrder() Order {
	return Order{
		ID:      uuid.New().String(),
		Deleted: false,
	}
}
