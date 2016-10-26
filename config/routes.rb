Rails.application.routes.draw do
  resources :categories
  resources :products

  root 'pages#home'
end
