Rails.application.routes.draw do

  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
  }
  # admin
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :products,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'top'=>'products#top'
  	resources :genres,only: [:index,:create,:edit,:update, :show]
  	resources :orders,only: [:index,:show,:update] do
  	  member do
       resource :order_details,only: [:update]
      end
    end
  end

   # customer
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

   get  'about' => 'customer/products#about'
   root 'customer/products#top'
   get 'contact' => 'customer/customers#contact'

   # devise
  devise_for :admins#, skip: :all
  #devise_scope :admin do
    #get 'admins/sign_in', to: 'admin/sessions#new'
    #post 'admins/sign_in', to: 'admin/sessions#create'
    #delete 'admins/sign_out', to:'admin/sessions#destory'
  #end


  #devise_for :customers, skip: :all
  #devise_scope :customer do
    #get 'sign_in', to: 'customers/sessions#new'
    #post 'sign_in', to: 'customers/sessions#create'
    #get 'sign_up', to: 'customers/registrations#new'
    #post 'sign_up', to: 'customers/registrations#create'
    #get 'password', to: 'customers/passwords#new'
    #post 'password', to: 'customers/passwords#create'
    #get 'password/edit', to: 'customers/passwords#edit'
    #put 'password', to: 'customers/passwords#update'
    #registrationsのedit/updateのURLだけ、わざとcustomerにしています
    #get 'edit', to: 'customers/registrations#edit'
    #put 'customer/password', to: 'customers/registrations#update'
  #end

end
