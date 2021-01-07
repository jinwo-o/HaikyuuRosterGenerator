package models

// Post type details
type Post struct {
	ID      int64  `json:"ID"`
	Name    string `json:"name"`
	Position  string `json:"position"`
	School string `json:"school"`
}
