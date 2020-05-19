class Customer::CartItemsController < ApplicationController

  # before_action :set_cart_item, only: [:update]

  def index
    @cart_items = current_customer.cart_items.all
  end

	def update
    @cart_item.update(quantity: params[:quantity].to_i)
	end

	def create
    @cart_item = CartItem.new(params_cart_item)
    @cart_item.save
    redirect_to customers_cart_items_path
    # else
    #   @product = CartItem.find_by(product_id: params[:product_id])
    #   render ("customer/products/show")
    # end
	end

	def all_destroy
	end

	def destroy
	end

  private

  # def set_cart_item
  #   @cart_item = current_customer.cart_items.fins_by(product_id: params[:product_id])
  # end

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
