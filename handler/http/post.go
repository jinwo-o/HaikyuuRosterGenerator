package handler

import (
	"encoding/json"
	"net/http"
	"fmt"
	"strconv"

	"github.com/go-chi/chi"
	"github.com/jinwo-o/HaikyuuRosterGenerator/driver"
	models "github.com/jinwo-o/HaikyuuRosterGenerator/models"
	repository "github.com/jinwo-o/HaikyuuRosterGenerator/repository"
	post "github.com/jinwo-o/HaikyuuRosterGenerator/repository/post"
)

// NewPostHandler ...
func NewPostHandler(db *driver.DB) *Post {
	return &Post{
		repo: post.NewSQLPostRepo(db.SQL),
	}
}

// Post ...
type Post struct {
	repo repository.PostRepo
}

// Trying to enable CORS
func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
}

// Fetch all roster data
func (p *Post) Fetch(w http.ResponseWriter, r *http.Request) {
	payload, _ := p.repo.Fetch(r.Context(), 5)
	enableCors(&w)
	respondwithJSON(w, http.StatusOK, payload)
}

// GetByID will fetch the player by ID
func (p *Post) GetByID(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(chi.URLParam(r, "id"))
	payload, err := p.repo.GetByID(r.Context(), int64(id))

	if err != nil {
		fmt.Println("Error: ID does not exist")
	}

	respondwithJSON(w, http.StatusOK, payload)
}

// Create a new Player
func (p *Post) Create(w http.ResponseWriter, r *http.Request) {
	post := models.Post{}
	json.NewDecoder(r.Body).Decode(&post)

	newID, err := p.repo.Create(r.Context(), &post)
	fmt.Println("New player ID is:", newID)
	if err != nil {
		fmt.Println("Error: Unable to create player")
	}

	respondwithJSON(w, http.StatusCreated, map[string]string{"message": "Successfully Created"})
}

// Update a player by id
func (p *Post) Update(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(chi.URLParam(r, "id"))
	data := models.Post{ID: int64(id)}
	json.NewDecoder(r.Body).Decode(&data)
	payload, err := p.repo.Update(r.Context(), &data)

	if err != nil {
		fmt.Println("Error: Unable to update player")
	}

	respondwithJSON(w, http.StatusOK, payload)
}

// Delete a player
func (p *Post) Delete(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(chi.URLParam(r, "id"))
	_, err := p.repo.Delete(r.Context(), int64(id))

	if err != nil {
		fmt.Println("Error: Unable to delete player")
	}

	respondwithJSON(w, http.StatusMovedPermanently, map[string]string{"message": "Delete Successfully"})
}

func respondwithJSON(w http.ResponseWriter, code int, payload interface{}) {
	response, _ := json.Marshal(payload)

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	w.Write(response)
}
