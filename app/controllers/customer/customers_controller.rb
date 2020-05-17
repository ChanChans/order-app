class Customer::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @cusotmer = current_customer
	end

	def quit
	end

	def out
    @customer = current_customer
    @customer.update(is_valid: true)

    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
	end

	def edit
		redirect_to customers_path
	end

	def update
		if @customer.update(customer_params)
  		redirect_to customers_path
  	else
  		render "customers/edit"
    end
	end

	private

	def customer_params
  	params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :residence, :phone_numbar)
  end

end
