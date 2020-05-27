class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_address, dependent: :destroy
  has_many :orders
  has_many :cart_items, dependent: :destroy

  validates :first_name, :last_name, :kana_first_name, :kana_last_name,
            :residence, :phone_number,
            presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  validates :phone_number, numericality: { only_integer: true }
  validates :kana_first_name, :kana_last_name,
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。"}

  # 退会機能
  def active_for_authentication?
    super && (self.is_valid == false)
  end

  # 住所の自動入力
  # include JpPrefecture
  # jp_prefecture :residence
  #
  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: residence).try(:name)
  # end
  #
  # def prefecture_name=(prefecture_name)
  #   self.residence = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end

end
