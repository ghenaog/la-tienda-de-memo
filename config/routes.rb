Rails.application.routes.draw do

  devise_for :users
  resources :categories
  resources :products
  resources :purchases

  root 'pages#home'

  get 'profile' => 'pages#profile'
  get 'dashboard' => 'purchases#dashboard'
end
