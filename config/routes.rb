Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: "auth#new", as: "login"
  post '/login', to: "auth#create", as: "authorize"
  delete '/login', to: "auth#destroy", as: "logout"

  post 'restaurants/find', to: "restaurants#find", as: "find"

  resources :restaurants, only: [:index, :show]
  resources :users, only: [:new, :create]
  # resources :reviews, only: [:create]
  post '/reviews', to: "reviews#create"
  get '/', to: "restaurants#index"
  

end
