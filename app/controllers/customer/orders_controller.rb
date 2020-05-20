class Customer::OrdersController < ApplicationController
  before_action :current_cart, only:[:log]

  def new
  	@order = Order.new
  	@customer = current_customer
  	@shipping_addresses = ShippingAddress.all
	end

	def log
		@order = Order.new
	end

	def create
		@order = Order.find(params[:id])
		@customer.find(params)
		if params [address_option] [0]
  		@customer.save
  	elsif params [address_option]  [1]
  	else params [address_option] [2]
  	end
	end

	def thenx
	end

	def index
	end

	def show
	  @order = Order.find(params[:id])
	end



end
