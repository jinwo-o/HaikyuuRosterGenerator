package models

// Post type details
type Post struct {
	ID      int64  `json:"ID"`
	Name    string `json:"name"`
	School string `json:"school"`
	Position  string `json:"position"`
	Serve      int64  `json:"serve"`
	ServeReception      int64  `json:"serve_reception"`
	Dig      int64  `json:"dig"`
	Set      int64  `json:"set"`
	Spike      int64  `json:"spike"`
	Block      int64  `json:"block"`
	Total      int64  `json:"total"`
	Notes    string `json:"notes"`
}
