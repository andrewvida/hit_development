Rails.application.routes.draw do
  get 'home/index'
  resources :posts
  resources :users
  resources :departments

  root to: 'home#index'
end
