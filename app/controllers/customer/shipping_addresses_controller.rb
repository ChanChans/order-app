class Customer::ShippingAddressesController < ApplicationController
	  #before_action :authenticate_customer!

    def index
    	@shipping_addresses = ShippingAddress.all
    	@shipping_address = ShippingAddress.new
    	@customer = current_customer
	end

	def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.customer_id = current_customer.id
		if @shipping_address.save
		   redirect_to customers_shipping_addresses_path
		else
		   @shipping_addresses = ShippingAddress.all
		   @customer = current_customer
		   render 'index'
	    end
	end

	def edit
	    @shipping_address = ShippingAddress.find(params[:id])
	end

	def update
		@shipping_address = ShippingAddress.find(params[:id])
		if @shipping_address.update(shipping_address_params)
		   redirect_to @shipping_address
		else
			render "edit"
		end
	end

	def destroy
	end

	private

	def shipping_address_params
  	    params.require(:shipping_address).permit(:postal_code, :address, :name, :customer_id)
    end

end
