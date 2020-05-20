Rails.application.routes.draw do
  # admin
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :products,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'top'=>'products#top'
  	resources :genres,only: [:index,:create,:edit,:update]
  	resources :orders,only: [:index,:show,:update] do
  	  member do
       resource :order_details,only: [:update]
      end
    end
  end

   # customer
   scope module: :customer do
    resources :products,only: [:index,:show]
  	resource :customers,only: [:show, :edit, :update] do
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
          get 'log'
          get 'thanx'
        end
      end

      resources :shipping_addresses,only: [:index,:create,:edit,:update,:destroy]
    end
   end

   get  'about' => 'customer/products#about'
   root 'customer/products#top'
   # devise
  devise_for :admins
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions'
  }
  devise_scope :customer do
    get 'customer/edit', to: 'customers/registrations#edit'
    put 'customer/edit', to: 'customers/registrations#update'
  end

end
