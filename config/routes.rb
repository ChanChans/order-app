Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
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

   scope module: :customer do
  	resource :customers,only: [:show,:edit,:update] do
  		collection do
  	        get 'quit'
  	        patch 'out'
  	    end

        resources :products,only: [:index,:show]
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
        resources :shipping_address,only: [:index,:create,:edit,:update,:destroy]
    end
   end
get  'about' => 'customer/products#about'
root 'customer/products#top'
end
