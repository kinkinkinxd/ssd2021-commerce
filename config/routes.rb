Rails.application.routes.draw do
  resources :categories
  root to: 'products#index'
  devise_for :admin
  resources :products
end
