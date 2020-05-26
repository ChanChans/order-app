Rails.application.routes.draw do

  # admin
  devise_for :admins
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :products,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'top'=>'products#top'
  	resources :genres,only: [:index,:create,:edit,:update, :show]
  	resources :orders,only: [:index,:show,:update] do
  	  member do
        get :current_index
        resource :order_details,only: [:update]
      end
      collection do
        get :today_order_index
      end
    end
  end

   # customer
   devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
   }

  get 'about' => 'customer/products#about'
  root 'customer/products#top'
  get 'contact' => 'customer/customers#contact'

  scope module: :customer do
    resources :products,only: [:index,:show]
    get 'search' => 'products#search'
    get 'customer/edit' => 'customers#edit'
    put 'customer' => 'customers#update'

  	resource :customers,only: [:show] do
  		collection do
  	     get 'quit'
  	     patch 'out'
  	  end

      resources :cart_items,only: [:index,:update,:create,:destroy] do
        collection do
          delete '/' => 'cart_items#all_destroy'
        end
      end

      resources :orders,only: [:new,:index,:show,:create] do
        collection do
          post 'log'
          get 'thanx'
        end
      end

      resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
    end
  end
end
