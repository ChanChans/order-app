# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
    Customer.create!(
      email: "test#{n + 1}@test.com",
      first_name: "名#{n + 1}",
      last_name: "姓#{n + 1}",
      kana_first_name: "セイ",
      kana_last_name: "メイ",
      password: "123456",
      postal_code: "1234567",
      residence: "テスト#{n + 1}",
      phone_number: "09012345678"
    )
  end

  Admin.create!(
    email: "admin@admin.com",
    password: "123456"
  )
  20.times do |n|
    Genre.create!(
      name: "ケーキ#{n + 1}",
      is_valid: [['有効', true], ['無効', false]]
    )
  end

  20.times do |n|
      Product.create!(
        name: "チーズケーキ#{n + 1}",
        explanation: "甘くて美味しい#{n + 1}",
        tax_out_price: "#{1000 + (n * 1000)}",
        genre_id: n + 1,
        is_sale: [['販売中', true], ['販売停止', false]],
        image: open("./app/assets/images/no_image.jpg")
      )
  end

9.times do |n|
  ShippingAddress.create!(
    name: "test#{n + 1}",
    postal_code: "123456#{n + 1}",
    address: "大阪#{n + 1}",
    customer_id: n + 1
  )
end

5.times do |n|
  Order.create!(
    customer_id: n +1,
    address: "大阪#{n + 1}",
    postal_code: "123456#{n + 1}",
    name: "test#{n + 1}",
    postage: "800",
    total_price: "#{1000 + (n * 1000) +800}",
    payment_method: "クレジットカード"
    )
end

5.times do |n|
  OrderDetail.create!(
    product_id: n + 1,
    order_id: n + 1,
    quantity: n + 3,
    subprice: "#{1000 + (n * 1000)}"
    )
end
