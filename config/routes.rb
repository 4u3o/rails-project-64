Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :posts, only: %i[show new create] do
    resources :comments, module: :posts, only: :create
  end
end
