class Customer::ProductsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

    def top
	end

	def about
	end

	def index
		@products = Product.all
	end

	def show
        @product = Product.find(params[:id])
	end

	private
	def product_params
		parmas.require(:product).permit(:image ,:name, :explanation, :tax_out_price, :is_sale)
end
