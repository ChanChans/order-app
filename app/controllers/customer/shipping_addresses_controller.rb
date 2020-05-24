class Customer::ShippingAddressesController < ApplicationController

    def index
    	@shipping_addresses = current_customer.shipping_address
    	@shipping_address = ShippingAddress.new
	end

	def create
		  @shipping_address = ShippingAddress.new(shipping_address_params)
		  @shipping_address.customer_id = current_customer.id
		  if @shipping_address.save
		  	 flash[:notice] = "新規配送先を作成しました"
		     redirect_to customers_shipping_addresses_path
		  else
		  	 @shipping_addresses = current_customer.shipping_address
		     render 'index'
	    end
	end

	def edit
	    @shipping_address = ShippingAddress.find(params[:id])
	end

	def update
		  @shipping_address = ShippingAddress.find(params[:id])
		  if @shipping_address.update(shipping_address_params)
		  	 flash[:notice] = "配送先を更新しました"
		     redirect_to customers_shipping_addresses_path
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
