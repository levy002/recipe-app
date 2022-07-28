Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :food_recipes, only: [:new, :create, :destroy, :update]
  end
  root 'users#index'
  resources :foods
end
