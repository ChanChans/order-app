class OrderDetail < ApplicationRecord

	belongs_to :order
	belongs_to :product

	validates :product_id, :order_id, :quantity,
			  :subprice, :produciton_status, presence: true
	validates :subprice, :quantity, numericality: { only_integer: true }
end
