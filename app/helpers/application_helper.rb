module ApplicationHelper

  # 小数点切り捨てはfloor,３桁区切りはto_s(:delimited)
  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

  # 小計の計算
  def sub_price(sub)
    (tax_price(sub.product.tax_out_price) * sub.quantity).to_s(:delimited)
  end

  # 合計金額の計算
  # def total_price
  #   current_cart = current_customer.cart_items
  #   sub_price(current_cart).sum.to_s(:delimited)
  # end
end
