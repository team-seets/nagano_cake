Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#top'
  get '/product/about' => 'products#about', as: 'about'
  resources :products, only: [:show,:index]
  resources :orders, only: [:new, :create, :index, :show, :thanks, :complete]
  resources :cart_products, only: [:index,:create,:update,:destroy,:destroy_all]
  resources :customers, only:[:index, :show, :edit, :create, :update, :destroy]
end
