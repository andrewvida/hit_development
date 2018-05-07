Rails.application.routes.draw do
  get 'home/index'
  get 'home/search', to: 'home#search'

  resources :users
  resources :posts
  resources :departments

  get 'users/:user_id/available_post_types', to: 'users#available_post_types'

  root to: 'home#index'
end
