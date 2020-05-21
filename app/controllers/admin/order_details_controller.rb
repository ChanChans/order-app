class Admin::OrderDetailsController < ApplicationController

  def update
  		@order_detail = OrderDetail.find(params[:id])
		  if @order_detail.update(order_detail_params)
		  	 flash[:notice] = "ステータスを更新しました"
		     redirect_to admin_order_path(@order_detail.order)
		  else
		     render "show"
		  end
  end

  private
  def order_detail_params
		  params.require(:order_detail).permit(:produciton_status)
	end

end
