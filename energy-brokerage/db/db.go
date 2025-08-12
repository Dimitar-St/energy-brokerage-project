package db

import (
	"log"
	"time"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func Initialize() gorm.DB {
	log.Println("Initializing Database connection...")

	dsn := "host=localhost user=postgres password=postgres dbname=energy-brokerage port=5432 sslmode=disable"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if err != nil {
		panic(err)
	}

	connection, err := db.DB()
	if err != nil {
		panic(err)
	}

	connection.SetConnMaxIdleTime(time.Second * 30)
	connection.SetConnMaxLifetime(time.Minute)
	connection.SetMaxIdleConns(10)
	connection.SetMaxOpenConns(100)

	log.Println("Initilization with Database successful!")

	return *db
}
