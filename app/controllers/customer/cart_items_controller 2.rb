class Customer::CartItemsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart_item, only: [:update, :destroy]
  # before_action :current_cart, only: [:index]

  def index
    @cart_items = current_cart 
  end

	def update
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    redirect_to customers_cart_items_path
	end

	def create
    @cart_item = current_customer.cart_items.new(params_cart_item)

      # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
    @update_cart_item =  CartItem.find_by(product: @cart_item.product)
    if @update_cart_item.present?
        @cart_item.quantity += @update_cart_item.quantity
        @update_cart_item.destroy
    end

    if @cart_item.save
      redirect_to products_path
    else
      @product = Product.find(params[:cart_item][:product_id])
      @cart_item = CartItem.new
      render ("customer/products/show")
    end
	end

	def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to customers_cart_items_path
	end

	def destroy
    @cart_item.destroy
    redirect_to customers_cart_items_path
	end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
