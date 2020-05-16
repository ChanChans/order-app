class Customer::ProductsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  def top
	end

	def about
	end

	def index
	end

	def show
	end
end
