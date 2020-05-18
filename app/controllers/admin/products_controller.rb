class Admin::ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update]
  before_action :set_genres, only: [:new, :edit, :index]

  def top
	end

	def new
    @product = Product.new
    @genres = Genre.all
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
    if @product.update(product_params)
      redirect_to @product
    else
      render "admin/edit"
    end
	end

  private

  def product_params
    params.require(:product).permit(:name, :image, :explanation,
       :genre_id, :tax_out_price, :is_sale)
  end

  def set_genres
    @genres = Genre.all
  end
end
