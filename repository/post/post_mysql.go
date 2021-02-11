package Post

import (
	"fmt"
	"context"
	"database/sql"

	models "github.com/jinwo-o/HaikyuuRosterGenerator/models"
	pRepo "github.com/jinwo-o/HaikyuuRosterGenerator/repository"
)

// NewSQLPostRepo retunrs implement of post repository interface
func NewSQLPostRepo(Conn *sql.DB) pRepo.PostRepo {
	return &mysqlPostRepo{
		Conn: Conn,
	}
}

type mysqlPostRepo struct {
	Conn *sql.DB
}

func (m *mysqlPostRepo) fetch(ctx context.Context, query string, args ...interface{}) ([]*models.Post, error) {
	rows, err := m.Conn.QueryContext(ctx, query, args...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	payload := make([]*models.Post, 0)
	for rows.Next() {
		data := new(models.Post)

		err := rows.Scan(
			&data.ID,
			&data.Name,
			&data.School,
			&data.Position,
			&data.Serve,
			&data.ServeReception,
			&data.Dig,
			&data.Set,
			&data.Spike,
			&data.Block,
			// &data.Total,
			// &data.Notes,
		)
		if err != nil {
			return nil, err
		}
		payload = append(payload, data)
	}
	return payload, nil
}

func (m *mysqlPostRepo) Fetch(ctx context.Context, num int64) ([]*models.Post, error) {
	// query := "Select ID, name, position, school, serve, serve_reception, dig, set, spike, block, total, notes From players_table"
	query := "Select * From players_table"


	return m.fetch(ctx, query)
}

func (m *mysqlPostRepo) GetByID(ctx context.Context, id int64) (*models.Post, error) {
	query := "Select ID, name, position, school, serve, serve_reception, dig, set, spike, block, total, notes From players_table where id=?"

	rows, err := m.fetch(ctx, query, id)
	if err != nil {
		return nil, err
	}

	payload := &models.Post{}
	if len(rows) > 0 {
		payload = rows[0]
	} else {
		return nil, models.ErrNotFound
	}

	return payload, nil
}

func (m *mysqlPostRepo) Create(ctx context.Context, p *models.Post) (int64, error) {
	query := "Insert players_table SET name=?, position=?, school=?, serve=?, serve_reception=?, dig=?, set=?, spike=?, block=?, total=?, notes=?"

	stmt, err := m.Conn.PrepareContext(ctx, query)
	if err != nil {
		return -1, err
	}

	res, err := stmt.ExecContext(ctx, p.Name, p.Position, p.School)
	defer stmt.Close()

	if err != nil {
		return -1, err
	}

	return res.LastInsertId()
}

func (m *mysqlPostRepo) Update(ctx context.Context, p *models.Post) (*models.Post, error) {
	query := "update players_table set name=?, position=?, school=?, serve=?, serve_reception=?, dig=?, set=?, spike=?, block=?, total=?, notes=? where id=?"

	stmt, err := m.Conn.PrepareContext(ctx, query)
	if err != nil {
		fmt.Println("Update Error has occred")
		return nil, err
	}
	_, err = stmt.ExecContext(ctx, p.ID, p.Name, p.Position, p.School)
	if err != nil {
		fmt.Println("Update Error2 has occred")
		return nil, err
	}
	defer stmt.Close()

	return p, nil
}

func (m *mysqlPostRepo) Delete(ctx context.Context, id int64) (bool, error) {
	query := "Delete From players_table Where id=?"

	stmt, err := m.Conn.PrepareContext(ctx, query)
	if err != nil {
		return false, err
	}
	_, err = stmt.ExecContext(ctx, id)
	if err != nil {
		return false, err
	}
	return true, nil
}