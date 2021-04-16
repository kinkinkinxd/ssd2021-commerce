Rails.application.routes.draw do
  devise_for :admin
  resources :categories
  namespace :admins do
    resources :products
    namespace :products do
      post 'csv_upload'
    end
  end
  root to: 'admins/products#index'
end
