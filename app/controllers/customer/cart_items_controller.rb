class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

	def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    redirect_to customers_cart_items_path
	end

	def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    @cart_item.customer_id = current_customer.id
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

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
