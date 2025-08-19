package logout

import (
	"energy-brokerage/response"
	"net/http"
	"time"
)

type logoutHandler struct {
}

func (h logoutHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Not the best way, via rotation will guaranty that the token is invalid
	cookie := &http.Cookie{
		Name:     "auth_token",
		Value:    "",
		Expires:  time.Unix(0, 0),
		HttpOnly: true,
		Path:     "/",
	}

	http.SetCookie(w, cookie)

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   map[string]string{"success": "logged out"},
		InternalResponse: "",
	})
}

func NewHander() http.Handler {
	return logoutHandler{}
}
