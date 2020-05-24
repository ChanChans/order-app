class Customer::ProductsController < ApplicationController

  before_action :authenticate!, except: [:index, :top]

  def top
    @products = Product.all
    @genres = Genre.all
	end

	def index
    @genres = Genre.all
    @products = Product.all.page(params[:page]).per(8)
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
