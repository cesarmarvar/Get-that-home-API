Rails.application.routes.draw do
  # sessions
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # users
  resources :users, except: %i[index]

  # properties
  resources :properties
  get "/random", to: "properties#random"

  # buyer properties
  get "/saved-properties", to: "buyer_properties#index"
end
