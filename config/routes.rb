Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users

  root 'users#index'
end
