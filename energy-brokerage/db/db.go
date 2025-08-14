package db

import (
	"log"
	"strconv"
	"time"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
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

func ApplyPagination(db *gorm.DB, values map[string][]string) {
	pageParam, ok := values["page"]
	if !ok {
		pageParam = []string{"0"}
	}

	limitParam, ok := values["limit"]
	if !ok {
		limitParam = []string{"20"}
	}

	if len(limitParam) == 0 || len(pageParam) == 0 {
		limitParam = []string{"20"}
		pageParam = []string{"0"}
	}

	limit, err := strconv.Atoi(limitParam[0])
	if err != nil {
		limit = 20
	}

	page, err := strconv.Atoi(pageParam[0])
	if err != nil {
		page = 0
	}

	db.Clauses(clause.Limit{Limit: &limit, Offset: page})
}
