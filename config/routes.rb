Rails.application.routes.draw do
  get 'home/index'
  get 'home/search', to: 'home#search'


  resources :users
  resources :departments do
    resources :posts
  end


  root to: 'home#index'
end
