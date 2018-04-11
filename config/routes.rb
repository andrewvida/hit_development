Rails.application.routes.draw do
  get 'home/index'
  get 'home/search', to: 'home#search'

  resources :posts
  resources :users
  resources :departments


  root to: 'home#index'
end
