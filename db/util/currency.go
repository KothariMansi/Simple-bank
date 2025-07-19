package util

// Constants for all supported currencies
const (
	USD = "USD"
	EUR = "EUR"
	INR = "INR"
	CAD = "CAD"
)

// IsSupportedCurrency return true if the currency is supported or false otherwise
func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, INR, CAD:
		return true
	}
	return false
}
