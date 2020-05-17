class Admin::ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def top
	end

	def new
    @product = Product.new
    @genre = Genre.all
	end

	def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render "admin/product"
    end
	end

	def index
	end

	def show
	end

	def edit
	end

	def update
	end

  private

  def product_params
    params.require(:product).permit(:name, :image, :explanation,
       :genre_id, :tax_out_price, :is_sale)
  end
end
