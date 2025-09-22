package token

import "time"

// Maker is an interface for managing token
type Maker interface {
	// Create token create a new token for a specific username and duration
	CreateToken(username string, duration time.Duration) (string, error)
	// Verify token checks if the token id valid or not
	VerifyToken(token string) (*Payload, error)
}
