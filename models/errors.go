package models

import "errors"

var (
	ErrNotFound = errors.New("requested item is not found")
)
