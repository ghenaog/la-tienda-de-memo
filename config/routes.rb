Rails.application.routes.draw do
  get 'pages/home'

  resources :categories
  resources :products
end
