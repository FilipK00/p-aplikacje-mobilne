Rails.application.routes.draw do
  resources :posts
  resources :petrol_stations
  resources :users
  
  root to: 'static#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
