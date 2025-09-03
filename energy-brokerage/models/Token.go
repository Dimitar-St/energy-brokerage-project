package models

import "fmt"

type Token struct {
	Value  string
	UserID string
}

func (t *Token) String() string {
	return fmt.Sprintf(`
     UserID: %v\n `, t.UserID)
}
