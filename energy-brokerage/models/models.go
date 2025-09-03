package models

type Model interface {
	String() string
}

var ActiveModels []any = []any{&User{}, &Order{}, &Token{}}
