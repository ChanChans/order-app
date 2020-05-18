class Customer::ShippingAddressesController < ApplicationController

    def index
    	@shipping_addresses = ShippingAddress.all
    	@shipping_address = ShippingAddress.new
    	#@customer = current_customer
	end

	def create
		@shipping_address = current_customer.shipping_address.new(shipping_address_params)
        #@shipping_address.customer_id = current_customer.id
		if @shipping_address.save
		   redirect_to customers_shipping_addresses_path
		else
		   @shipping_addresses = ShippingAddress.all
		   #@customer = current_customer
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
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_address.destroy
		redirect_to customers_shipping_addresses_path
	end

	private

	def shipping_address_params
  	    params.require(:shipping_address).permit(:postal_code, :address, :name)
    end

end
