class ShippingAddress < ApplicationRecord
	belongs_to :customer

	validates :customer_id, :name, :address, presence: true
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

<<<<<<< HEAD
  after_create :address_all

  def address_all
    self.postal_code.to_s + self.address
  end

  # selfの意味がいまだによくわかりません
=======
	def order_address
			self.postal_code + self.address + self.name
	end
>>>>>>> e9cf965a4cd6e4bea59394e635704cfe326c1ee3

end
