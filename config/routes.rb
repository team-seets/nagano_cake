Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#top'
  get '/product/about' => 'products#about', as: 'about'
  resources :products, only: [:show,:index]
end
