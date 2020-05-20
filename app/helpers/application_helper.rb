module ApplicationHelper

  # 小数点切り捨てはfloor,３桁区切りはto_s(:delimited)
  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

  # 小計の計算
  def sub_price(sub)
    (tax_price(sub.product.tax_out_price) * sub.quantity)
  end

  # 合計金額の計算
  def total_price(totals)
    total_price = 0
      totals.each do |total|
        total_price  +=  sub_price(total)
      end
      return total_price
  end
end
