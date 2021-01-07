Rails.application.routes.draw do
  resources :users
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  resources :admins
  # post "/admin/create", to: "admin#create"

  resources :defaults

  get "physios/index", to: "physios#show"
  get "physios/gen", to: "physios#generate_token"

  #TODO
  # TERMINAR DE FAZER O LINK FUNCIONAR (CONTROLLER DEFAULT)
end
