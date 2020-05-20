class Customer::CartItemsController < ApplicationController

  before_action :set_cart_item, only: [:update, :destroy]
  before_action :current_cart, only: [:index]

  def index
  end

	def update
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    redirect_to customers_cart_items_path
	end

	def create
    @cart_item = current_customer.cart_items.new(params_cart_item)

      # カートの中に同じ商品が重複しないようにして　古い商品を消して新しい商品を保存する
      # undefined method `find_by' for nil:NilClassと出る
    # @existing_cart_item =  @cart_items.find_by(product_id: @cart_item.product_id)
    # if @existing_cart_item.present?
    #     @existing_cart_item.destroy
    # end

    if @cart_item.save
      redirect_to products_path
    # else
    #   @product = CartItem.find_by(product_id: params[:product_id])
    #   @cart_item = CartItem.new
    #   render ("customer/products/show")
    end
	end

	def all_destroy
    # @cart_items = current_customer.cart_items.all
    # @cart_items = CartItem.where(customer_id: current_customer.id)
    # @cart_items = CartItem.all
    # wrong number of arguments (given 0, expected 1)が出る（引数が足りない）
    # binding.pry
    @cart_items.destroy
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
