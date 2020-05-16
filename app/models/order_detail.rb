class OrderDetail < ApplicationRecord

	validates :product_id, :order_id, :quantity,
			  :subprice, :produciton_status, presence: true
end
