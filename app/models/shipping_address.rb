class ShippingAddress < ApplicationRecord
	belongs_to :customer

	validates :customer_id, :name, :address, presence: true
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

	def order_address
			self.postal_code + self.address + self.name
	end

end
