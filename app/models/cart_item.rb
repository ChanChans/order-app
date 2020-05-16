class CartItem < ApplicationRecord

	validates :customer_id, :product_id, :quantity, presence: true
end
