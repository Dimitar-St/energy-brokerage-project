package filter

import (
	"errors"
	"net/url"
	"time"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type Operator string

const (
	OpEq  Operator = "="
	OpGte Operator = ">="
	OpLte Operator = "<="
)

type Condition struct {
	Field    string
	Operator Operator
	Values   []any
}

type Filter struct {
	Conditions []Condition
}

var Offset = 0

func (f *Filter) Apply(query *gorm.DB) *gorm.DB {
	for _, c := range f.Conditions {
		if len(c.Values) == 1 {
			if len(query.Statement.Clauses) > 0 {
				query = query.Clauses(clause.And(gorm.Expr(c.Field+" "+string(c.Operator)+" ?", c.Values[0])))
			} else {
				query = query.Where(c.Field+" "+string(c.Operator)+" ?", c.Values[0])
			}
		}
	}

	return query
}

type ParamDef struct {
	Field     string
	Operator  Operator
	ParseFunc func([]string) ([]any, error)
}

func validateDate(layout string) func([]string) ([]any, error) {
	return func(values []string) ([]any, error) {
		if len(values) == 0 || values[0] == "" {
			return nil, nil
		}
		_, err := time.Parse(layout, values[0])
		if err != nil {
			return nil, err
		}
		return []any{values[0]}, nil
	}
}

func parseDateRange(layout string) func([]string) ([]any, error) {
	return func(values []string) ([]any, error) {
		if len(values) < 2 || values[0] == "" || values[1] == "" {
			return nil, nil
		}
		start, err := time.Parse(layout, values[0])
		if err != nil {
			return nil, err
		}
		end, err := time.Parse(layout, values[1])
		if err != nil {
			return nil, err
		}
		return []any{start, end}, nil
	}
}

func NewFilter(values url.Values) (*Filter, error) {
	layout := "2006-01-02"

	paramDefs := map[string]ParamDef{
		"type": {Field: "type", Operator: OpEq, ParseFunc: func(v []string) ([]any, error) {
			if len(v) == 0 || len(v) > 1 {
				return nil, errors.New("illegal value")
			}
			if v[0] == "" || !(v[0] == "buy" || v[0] == "sell") {
				return nil, errors.New("illegal value")
			}
			return []any{v[0]}, nil
		}},
		"from": {Field: "delivery_time", Operator: OpGte, ParseFunc: validateDate(layout)},
		"to":   {Field: "delivery_time", Operator: OpLte, ParseFunc: validateDate(layout)},
	}

	f := &Filter{}

	for param, def := range paramDefs {
		if rawVals, ok := values[param]; ok {
			parsed, err := def.ParseFunc(rawVals)
			if err != nil {
				return nil, err
			}
			if parsed != nil {
				f.Conditions = append(f.Conditions, Condition{
					Field:    def.Field,
					Operator: def.Operator,
					Values:   parsed,
				})
			}
		}
	}

	return f, nil
}
