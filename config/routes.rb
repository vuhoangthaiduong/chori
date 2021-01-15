Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do 
    member do
      get :ingredients, :recipes
    end
  end
  resources :recipes
  resources :ingredients
  resources :ingredients_users, only: [:create, :destroy]

end
