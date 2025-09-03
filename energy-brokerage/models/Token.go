package models

import "fmt"

type Token struct {
	ID      string `gorm:"primaryKey"`
	UserID  string `gorm:"not null"`
	Revoked bool   `gorm:"not null"`
}

func (t Token) String() string {
	return fmt.Sprintf(`
     UserID: %v\n `, t.UserID)
}
