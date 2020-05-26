class OrderDetail < ApplicationRecord

	belongs_to :order
	belongs_to :product

	validates :product_id, :order_id, :quantity,
			  		:subprice, presence: true
	validates :subprice, :quantity, numericality: { only_integer: true }

	enum produciton_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}
end
