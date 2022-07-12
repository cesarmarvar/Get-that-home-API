Rails.application.routes.draw do
  # sessions
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"

  # users
  resources :users, except: %i[index create]

  # properties
  resources :properties
  get "/random", to: "properties#random"

  # buyer properties
  get "/saved-properties", to: "buyer_properties#index"
end
