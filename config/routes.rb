Rails.application.routes.draw do
  # api_guard_routes for: 'users'
  api_guard_routes for: 'users', controller: {
    registration: 'users/registration',
    authentication: 'users/authentication',
  }
  post "/users/reactivate", to: "users#reactivate"
end
