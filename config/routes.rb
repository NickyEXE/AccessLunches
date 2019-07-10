Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :reviews, only: [:create, :destroy]

  get '/login', to: "auth#new", as: "login"
  post '/login', to: "auth#create", as: "authorize"
  delete '/login', to: "auth#destroy", as: "logout"

end
