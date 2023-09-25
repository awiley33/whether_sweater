Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'api/v0/forecast', to: "api/v0/forecast#show"
  get "api/v0/book-search", to: "api/v0/book#index"
end
