Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  namespace :admin do
  	resources :customers,only: [:index,:show,:edit,:update]
  	resources :products,only: [:index,:new,:create,:show,:edit,:update,] do
  		collection do
  	        get 'top'
  	    end
  	end
  	resources :genres,only: [:index,:create,:edit,:update]
  	resources :orders,only: [:index,:show,:update]
  	resources :order_details,only: [:update]
  end
   scope module: :customer do
  	resource :customers,only: [:show,:edit,:update] do
  		collection do
  	        get 'quit'
  	        patch 'out'
  	    end
  	
        resources :products,only: [:index,:show] do
    	     collection do
                 get 'about'
             end
        end
        resources :cart_items,only: [:index,:update,:create,] do
              member do
                  delete 'one_destroy'
              end
              collection do 
        	      delete 'destroy'
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
  
end
