Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'recipes/index'
  devise_for :users
  resources :recipes, only: [:index, :new, :create, :destroy]
  root 'users#index'
  resources :foods
end
