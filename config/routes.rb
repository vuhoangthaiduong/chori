Rails.application.routes.draw do
  get 'shopping_lists/new'
  get 'shopping_lists/edit'
  root   'static_pages#home'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get '/ingredients', to: 'ingredients_users#show_ingredients', as: :user_show_ingredients
    end
  end
  resources :recipes
  resources :ingredients
  resources :ingredients_users, only: %i[create destroy]

end