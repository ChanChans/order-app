class Admin::OrdersController < ApplicationController

  	def index
  		@orders = Order.all.page(params[:page]).per(10)
	end

	def show
		@order_details = OrderDetail.all
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
		   flash[:notice] = "ステータスを更新しました"
		   redirect_to admin_orders_path
		else
		   render "show"
		end
	end

	private
	def order_params
		  params.require(:order).permit(:order_status)
	end


end
