package filter

import (
	"net/url"
	"time"

	"gorm.io/gorm"
)

type Operator string

const (
	OpEq      Operator = "="
	OpGte     Operator = ">="
	OpLte     Operator = "<="
	OpBetween Operator = "BETWEEN"
)

type Condition struct {
	Field    string
	Operator Operator
	Values   []any
}

type Filter struct {
	Conditions []Condition
}

func (f *Filter) Apply(query *gorm.DB) *gorm.DB {
	for _, c := range f.Conditions {
		switch c.Operator {
		case OpBetween:
			if len(c.Values) == 2 {
				query = query.Where(c.Field+" BETWEEN ? AND ?", c.Values[0], c.Values[1])
			}
		default:
			if len(c.Values) == 1 {
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

func parseDate(layout string) func([]string) ([]any, error) {
	return func(values []string) ([]any, error) {
		if len(values) == 0 || values[0] == "" {
			return nil, nil
		}
		t, err := time.Parse(layout, values[0])
		if err != nil {
			return nil, err
		}
		return []any{t}, nil
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
		"status": {Field: "status", Operator: OpEq, ParseFunc: func(v []string) ([]any, error) {
			if len(v) == 0 || v[0] == "" {
				return nil, nil
			}
			return []any{v[0]}, nil
		}},
		"start": {Field: "delivery_time", Operator: OpGte, ParseFunc: parseDate(layout)},
		"end":   {Field: "delivery_time", Operator: OpLte, ParseFunc: parseDate(layout)},
		"range": {Field: "delivery_time", Operator: OpBetween, ParseFunc: parseDateRange(layout)},
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
