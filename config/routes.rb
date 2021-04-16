Rails.application.routes.draw do
  devise_for :admin
  resources :categories
  namespace :admins do
    resources :products
    namespace :products do
      delete 'remove_cover_image'
      post 'csv_upload'
    end
  end
  root to: 'admins/products#index'
end
