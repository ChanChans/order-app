class Customer::ProductsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  def top
    @products = Product.all
	end

	def about
	end

	def index
		@products = Product.all.page(params[:page]).per(5)
	end

	def show
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
	end

	private
	def product_params
		parmas.require(:product).permit(:image ,:name, :explanation, :tax_out_price, :is_sale)
	end
end
