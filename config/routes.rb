Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'api/v0/forecast', to: "api/v0/forecast#show"
  get "api/v0/book-search", to: "api/v0/book#index"
  post 'api/v0/users', to: "api/v0/users#create"
  post "/api/v0/sessions", to: "api/v0/sessions#create"
  post "/api/v0/road_trip", to: "api/v0/road_trips#create"

end
