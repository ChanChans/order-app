class Customer::ProductsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  def top
    @products = Product.all
    @genres = Genre.all
	end

	def about
	end

	def index
    if params[:genre_id]
      # Genreのデータベースのテーブルから一致するidを取得
      @genre = Genre.find(params[:genre_id])
      # genre_idと紐づく商品を取得
      @products = @genre.products.order(created_at: :desc).all
    else
      # 商品すべてを取得
      @products = Product.all.page(params[:page]).per(5)
    end
	end

	def show
        @product = Product.find(params[:id])
        @cart_item = CartItem.new
	end

	private
	def product_params
		parmas.require(:product).permit(:image ,:name, :explanation, :tax_out_price, :is_sale)
	end
end
