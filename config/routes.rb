Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts
  resources :petrol_stations
  resources :users
  
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
