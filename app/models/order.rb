class Order < ApplicationRecord

	belongs_to :customer

	validates :customer_id, :address,:name, :postage,
			  :total_price, :payment_method, :order_status,
			  presence: true
	validates :postal_code, length: {is: 7}
end
