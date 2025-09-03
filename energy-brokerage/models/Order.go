package models

import (
	"database/sql/driver"
	"encoding/json"
	"time"

	"fmt"
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

func (s OrderStatus) UnmarshalJSON(data []byte) error {
	return json.Unmarshal(data, &s)
}

func (s OrderStatus) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

type Order struct {
	ID           string      `gorm:"primaryKey"`
	Type         string      `gorm:"not null" json:"type" csv:"type"`
	DeliveryTime LocalTime   `gorm:"not null;type:timestamptz" json:"deliveryTime" csv:"deliveryTime"`
	Amount       int         `gorm:"not null" json:"amount" csv:"amount"`
	Price        int         `gorm:"not null" json:"price" csv:"price"`
	Status       OrderStatus `gorm:"not null" json:"status" csv:"status"`
	Deleted      bool        `gorm:"not null"`
	UserID       string      `gorm:"not null" json:"user"`
}

func (o Order) String() string {
	return fmt.Sprintf(`
			ID: %v,\n
			Type: %v,\n
			DeliveryTime: %v,\n
			Amount: %v,\n
			Price: %v,\n
			Status: %v\n
		`, o.ID, o.Type, o.DeliveryTime, o.Amount, o.Price, o.Status)
}

const TimeFormat = "2006-01-02 15:04:05.000 -0700"

type LocalTime time.Time

func (t *LocalTime) UnmarshalJSON(data []byte) (err error) {
	if string(data) == `""` {
		*t = LocalTime(time.Time{})
		return nil
	}

	str := string(data[1 : len(data)-1])

	if parsed, err := time.Parse(TimeFormat, str); err == nil {
		*t = LocalTime(parsed)
		return nil
	}

	if parsed, err := time.Parse("2006-01-02", str); err == nil {
		*t = LocalTime(parsed)
		return nil
	}

	return fmt.Errorf("unsupported time format: %s", str)
}

func (t LocalTime) MarshalJSON() ([]byte, error) {
	formatted := time.Time(t).Format(TimeFormat)
	return json.Marshal(formatted)
}

func (t LocalTime) Value() (driver.Value, error) {
	if t.String() == "0001-01-01 00:00:00" {
		return nil, nil
	}
	return []byte(time.Time(t).Format(TimeFormat)), nil
}

func (t *LocalTime) Scan(value any) error {
	if value == nil {
		*t = LocalTime(time.Time{})
		return nil
	}

	switch v := value.(type) {
	case time.Time:
		*t = LocalTime(v)
	case []byte:
		parsed, err := time.Parse(TimeFormat, string(v))
		if err != nil {
			return err
		}
		*t = LocalTime(parsed)
	case string:
		parsed, err := time.Parse(TimeFormat, v)
		if err != nil {
			return err
		}
		*t = LocalTime(parsed)
	default:
		return fmt.Errorf("cannot scan LocalTime from %T", value)
	}
	return nil
}

func (t LocalTime) String() string {
	return time.Time(t).Format(TimeFormat)
}

func NewOrder() Order {
	return Order{}
}
