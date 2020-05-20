class Order < ApplicationRecord

	belongs_to :customer
	has_many :order_details, dependent: :destroy

	validates :customer_id, :address,:name, :postage,
			  :total_price, :payment_method, :order_status,
			  presence: true
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :postage, :total_price, numericality: { only_integer: true }

	enum payment_method: { credit: 1, bank: 2}
	enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
	enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}
end
