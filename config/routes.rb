Rails.application.routes.draw do
  resources :post_dates
  get 'sessions/new'
  resources :users
  resources :petrol_stations do
    resources :post_dates, only: [:new, :create, :edit, :update, :show, :destroy] do
      resources :posts, only: [:new, :create, :edit, :update, :show, :destroy]
    end
  end
  
  root to: 'static#index'
  get '/api' => redirect('apidocs/swagger/dist/index.html?url=/api-docs.json')

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get    '/feed',   to: 'static#feed'

end
