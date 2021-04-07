Rails.application.routes.draw do
  resources :categories
  root to: 'products#index'
  devise_for :admin
  resources :products
  namespace :products do
    post 'csv_upload'
  end
end
