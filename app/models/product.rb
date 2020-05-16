class Product < ApplicationRecord

	belongs_to :genre

	validates :genre_id, :name, :tax_out_price, :is_sale, presence: true
	validates :explanation, length: {maximum: 200}
end
