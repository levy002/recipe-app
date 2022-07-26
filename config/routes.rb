Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users

  resources :recipes, only: [:index, :new, :create, :destroy]
  root 'users#index'
end
