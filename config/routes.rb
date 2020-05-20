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
  devise_for :admins#, skip: :all
  #devise_scope :admin do
    #get 'admins/sign_in', to: 'admin/sessions#new'
    #post 'admins/sign_in', to: 'admin/sessions#create'
    #delete 'admins/sign_out', to:'admin/sessions#destory'
  #end

  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions'
  }
  devise_scope :customer do
    get 'customer/edit', to: 'customers/registrations#edit'
    put 'customer/edit', to: 'customers/registrations#update'
  end
  #devise_for :customers, skip: :all
  #devise_scope :customer do
    #get 'customers/sign_in', to: 'customers/sessions#new'
    #post 'customers/sign_in', to: 'customers/sessions#create'
    #delete 'customers/sign_out', to: 'customers/sessions#destroy'
    #get 'customers/sign_up', to: 'customers/registrations#new'
    #post 'customers/sign_up', to: 'customers/registrations#create'
    #get 'customers/password', to: 'customers/passwords#new'
    #post 'customers/password', to: 'customers/passwords#create'
    #get 'customers/password/edit', to: 'customers/passwords#edit'
    #put 'customers/password', to: 'customers/passwords#update'
    #registrationsのedit/updateのURLだけ、わざとcustomerにしています
    #get 'customer/edit', to: 'customers/registrations#edit'
    #put 'customer', to: 'customers/registrations#update'
  #end

end
