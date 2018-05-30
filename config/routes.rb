Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'search', to: 'home#search'
  get 'faqs', to: 'home#faqs'
  get 'howtos', to: 'home#howtos'
  get 'linkto', to: 'home#linkto'
  get 'careers', to: 'home#careers'
  get 'leadership', to: 'home#leadership'

  resources :users
  resources :posts
  resources :departments

  get 'users/:id/available_post_types', to: 'users#available_post_types'

  root to: 'home#index'
end
