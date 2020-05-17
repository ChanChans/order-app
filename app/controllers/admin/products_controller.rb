class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!

  def top
	end

	def new
    @product = Product.new
    @genre = Genre.all
	end

	def create
	end

	def index
	end

	def show
	end

	def edit
	end

	def update
	end
end
