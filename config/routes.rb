Rails.application.routes.draw do

  resources :books_coupons, only: [:new, :create, :index]
  resources :orders, only: [:new, :create]
  root 'orders#new'
end
