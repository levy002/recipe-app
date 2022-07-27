Rails.application.routes.draw do
  resources :food_recipes
  get 'recipes/index'
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update]
  root 'users#index'
  resources :foods
end
