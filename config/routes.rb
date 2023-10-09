Rails.application.routes.draw do
  resources :posts
  resources :categories
  root 'home#index'

  devise_for :users
end
