Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions: 'customer/sessions',
  passwords: 'customer/passwords',
  registrations: 'customer/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'customers/products#top'

  scope module: :customers do
  resources :products, only: [:show,:index]

  #resources :orders, only: [:new, :create, :index, :show]
  resources :cart_products, only: [:index,:create,:update,:destroy]

  get 'orders/thanx' => 'orders#thanx', as: 'thanx'
  resources :orders, only: [:new, :create, :index, :show]

  delete 'cart_products' => 'cart_products#destroy_all', as: 'destroy_all'

  get 'product/about' => 'customers/products#about', as: 'about'
  resources :products, only: [:show,:index], module: 'customers'
 # resources :orders, only: [:new, :create, :index, :show]

  resources :cart_products, only: [:index,:create,:update,:destroy,:destroy_all]
  resources :addresses, only: [:new, :index, :edit, :create, :update, :destroy]

  get 'searches' => 'search#search', as: 'search'


  resources :customers do
    collection do
    get :quit
    patch :withdraw
  end



end
end
  namespace :customers do
    post 'orders/complete' => 'orders#complete', as: 'complete'
    #get 'orders/thanx' => 'orders#thanx', as: 'thanx'
  end

  devise_for :admins, controllers: {
  sessions: 'admin/sessions',
  passwords: 'admin/passwords',
  registrations: 'admin/registrations'
  }
  namespace :admins do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :products, only:[:index, :new, :show, :edit, :create, :update]
    get 'top' => 'products#top'
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :end_users, only: [:index, :show, :edit, :update]

  get 'searches' => 'search#search', as: 'search'

  end
end