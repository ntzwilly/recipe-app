Rails.application.routes.draw do
  devise_for :users 
  root to: 'foods#index'
  resources :foods, only: [:index, :create, :new, :destroy]
  resources :recipes
end
