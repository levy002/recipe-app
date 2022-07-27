Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  root 'users#index'
  resources :foods
end
