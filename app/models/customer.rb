class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_address
  has_many :orders
  has_many :cart_items

  validates :first_name, :last_name, :kana_first_name, :kana_last_name,
   			:residence, :phone_number, :is_valid,
   			presence: true
  validates :postal_code, length: {is: 7}
end
