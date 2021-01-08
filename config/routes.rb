Rails.application.routes.draw do
  delete "/users", to: "users#destroy"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/users/index", to: "users#show"

  post "/admin", to: "admin#create"

  post "/defaults/gen_link", to: "defaults#generate_link"
  get "/defaults/index", to: "defaults#show"
  post "defaults", to: "defaults#create"

  get "/physios/index", to: "physios#show"
  get "/physios/gen", to: "physios#generate_token"
  post "/physios", to: "physios#create"

  get "/links/index", to: "links#show"
end
