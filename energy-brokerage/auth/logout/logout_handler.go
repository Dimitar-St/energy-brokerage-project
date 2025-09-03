package logout

import (
	"energy-brokerage/response"
	"energy-brokerage/token"
	"net/http"
	"time"
)

type logoutHandler struct {
	tokenProvider token.TokenProvider
}

func (h logoutHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	cookie := &http.Cookie{
		Name:     "auth_token",
		Value:    "",
		Expires:  time.Unix(0, 0),
		HttpOnly: true,
		Path:     "/",
	}

	http.SetCookie(w, cookie)

	jti := r.Context().Value("jti")

	err := h.tokenProvider.Revoke(jti.(string))
	message := ""
	if err != nil {
		message = err.Error()
	}

	response.WriteJSON(w, http.StatusOK, response.Response{
		ClientResponse:   map[string]string{"success": "logged out"},
		InternalResponse: message,
	})
}

func NewHander(tokenProvider token.TokenProvider) http.Handler {
	return logoutHandler{
		tokenProvider: tokenProvider,
	}
}
