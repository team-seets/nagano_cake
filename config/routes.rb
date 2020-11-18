Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#top'
  get '/product/about' => 'products#about', as: 'about'
  resources :products, only: [:show,:index]
<<<<<<< HEAD
  resources :cart_products, only: [:index,:create,:update,:destroy,:destroy_all]
=======

  resources :customers
  resources :products, only: [:index,:show]
>>>>>>> ff2ff171778a8c5120e8f990e7cbb024ecdf741e
end
