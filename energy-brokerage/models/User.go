package models

type User struct {
	ID       string `gorm:"primaryKey"`
	Username string `gorm:"unique;not null"`
	Salt     string `gorm:"not null"`
	Password string `gorm:"not null"`
}
