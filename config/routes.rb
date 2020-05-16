Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
  	resources :customers,only: [:index,:show,:edit,:update]
  	resources :products,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'prodcts/top'
  	resources :genres,only: [:index,:create,:edit,:update]
  	resources :orders,only: [:index,:show,:update]
  	resources :order_details,only: [:update]
  end
  devise_for :customers
  namespace :customer do
  	resources :customers,only: [:show,:edit,:update]
  	get 'customers/quit'
  	patch 'customers/out'
    resources :products,only: [:index,:show]
    get 'products/about'
    resources :cart_items,only: [:index,:update,:create,:destroy]
    delete 'cart_items/:id/one_destroy'
    resources :orders,only: [:new,:index,:show,:create]
    get 'orders/log'
    get 'orders/thanx'
    resources :shipping_address,only: [:index,:create,:edit,:update,:destroy]
   end
  
end
