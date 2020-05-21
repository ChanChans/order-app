class Customer::OrdersController < ApplicationController
  include ApplicationHelper

  def new
  	@order = Order.new
  	@shipping_addresses = ShippingAddress.all
	end

	def log
    @cart_items = current_cart
		@order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )
    # binding.pry
      # addressにresidenceの値がはいっていれば
      if params[:order][:addresses] == "residence"
        @order.postal_code = current_customer.postal_code
        @order.address     = current_customer.residence
        @order.name        = current_customer.last_name +
                             current_customer.first_name

      # addressにshipping_addressesの値がはいっていれば
      elsif params[:order][:addresses] == "shipping_addresses"
        ship = ShippingAddress.find(params[:order][:shipping_address_id])
        @order.postal_code = ship.postal_code
        @order.address     = ship.address
        @order.name        = ship.name

      # addressにnew_addressの値がはいっていれば
      elsif params[:order][:addresses] == "new_address"
        @order.postal_code = params[:order][:postal_code]
        @order.address     = params[:order][:address]
        @order.name        = params[:order][:name]
        @ship = "1"
      end

     # total_priceに請求額を代入
     @order.total_price = billing(@order)
	end

	def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to thanx_customers_orders_path

    # もし情報入力でnew_addressの場合ShippingAddressに保存
    if params[:order][:ship] == "1"
      current_customer.shipping_address.create(address_params)
    end

    # カート商品の情報を注文商品に移動
    @cart_items = current_cart
    @cart_items.each do |cart_item|
    OrderDetail.create(
      product:  cart_item.product,
      order:    @order,
      quantity: cart_item.quantity,
      subprice: sub_price(cart_item)
    )
    end
    # 注文完了後、カート商品を空にする
    @cart_items.destroy_all
	end

	def thanx
	end

	def index
	end

	def show
	  @order = Order.find(params[:id])
	end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  # def to_log
  #   redirect_to customers_cart_items_path if params[:id] == "log"
  # end
end
