package api

import (
	db "github.com/KothariMansi/simplebank/db/sqlc"
	"github.com/gin-gonic/gin"
)

// Server serve HTTP request for our banking service
type Server struct {
	store  db.Store
	router *gin.Engine
}

// New Server create a new HTTP server and setup routing.
func NewServer(store db.Store) *Server {
	server := &Server{store: store}
	router := gin.Default()

	// Add route to router
	router.POST("/accounts", server.createAccount)
	router.GET("/accounts/:id", server.getAccount)
	router.GET("/accounts", server.listAccount)
	router.DELETE("/accounts/:id", server.deleteAccount)
	router.PATCH("/accounts", server.updateAccount)

	router.POST("/entries", server.createEntry)
	router.GET("/entries/:id", server.getEntry)
	router.GET("/entries", server.listEntry)

	router.POST("/transfers", server.createTransfer)

	server.router = router
	return server
}

// Start run the HTTP server on a specific address.
func (server *Server) Start(address string) error {
	return server.router.Run(address)
}

func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
