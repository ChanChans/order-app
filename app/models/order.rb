class Order < ApplicationRecord

	belongs_to :customer
	has_many :order_details, dependent: :destroy

	validates :customer_id, :address,:name, :postage,
			  :total_price, :payment_method, :order_status,
			  presence: true
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :postage, :total_price, numericality: { only_integer: true }
end
