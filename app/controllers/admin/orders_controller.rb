class Admin::OrdersController < ApplicationController

  	def index
  		@orders = Order.all.page(params[:page]).per(10)
	end

	def show
		@customer = Customer.find(params[:id])
		@shipping_address = ShippingAddress.find(params[:id])
		@order_details = OrderDetail.find(params[:id])
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
		end
	end


end
