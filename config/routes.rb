Rails.application.routes.draw do
  get 'home/index'
  get 'home/search', to: 'home#search'

  resources :users
  resources :posts
  resources :departments

  root to: 'home#index'
end
