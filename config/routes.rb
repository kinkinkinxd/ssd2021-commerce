Rails.application.routes.draw do
  devise_for :admin
  resources :categories
  get '/orders/new_order', to: 'orders#new', as: 'orders_new'
  resources :orders
  namespace :admins do
    resources :products
    namespace :products do
      delete 'remove_cover_image'
      post 'csv_upload'
    end
  end
  root to: 'admins/products#index'
end
