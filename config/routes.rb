Rails.application.routes.draw do
  resource :users
  get "/index", to: "users#index"
  post "/create", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
