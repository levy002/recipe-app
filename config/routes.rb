Rails.application.routes.draw do
  get 'general_shopping_list/index'
  get 'public_recipes/index'
  get 'recipes/index'
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :food_recipes, only: [:new, :create, :destroy, :edit, :update]
  end
  root 'users#index'
  resources :foods
end
