class Genre < ApplicationRecord

	has_many :products

	validates :name, :is_valid, presence: true
	# validates :name, :is_valid, presence: true
end
