package models

import "fmt"

type User struct {
	ID       string `gorm:"primaryKey"`
	Username string `gorm:"unique;not null"`
	Salt     string `gorm:"not null"`
	Password string `gorm:"not null"`
}

func (u User) String() string {
	return fmt.Sprintf(`
		ID: %v,\n
		Username: %v\n
		`, u.ID, u.Username)
}
