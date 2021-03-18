Rails.application.routes.draw do
  root to: 'commerces#index'
  devise_for :admin
  resources :commerces
end
