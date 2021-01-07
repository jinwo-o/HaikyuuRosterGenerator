package driver

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

// DB ...
type DB struct {
	SQL *sql.DB
}

// DBConn ...
var dbConn = &DB{}

// ConnectSQL ...
func ConnectSQL() (*DB, error) {
	d, err := sql.Open("mysql", "docker:docker@tcp(db:3306)/players")

	if err != nil {
		panic(err)
	}
	dbConn.SQL = d
	return dbConn, err
}
