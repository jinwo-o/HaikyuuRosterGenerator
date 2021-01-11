package models

// Post type details
type Post struct {
	ID      int64  `json:"ID"`
	Name    string `json:"name"`
	Position  string `json:"position"`
	School string `json:"school"`
	Serve      int64  `json:"serve"`
	ServeReception      int64  `json:"serve_reception"`
	Dig      int64  `json:"dig"`
	Set      int64  `json:"set"`
	Spike      int64  `json:"spike"`
	Block      int64  `json:"block"`
	Total      int64  `json:"total"`
	Notes    string `json:"notes"`
}
