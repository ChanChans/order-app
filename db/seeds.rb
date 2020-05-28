# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  # Admin.create!(
  #   email: ENV['admin_mail'],
  #   password: ENV['admin_pass']
  # )
  Admin.create!(
    email: "admin1@admin.com",
    password: "123456"
  )

  Genre.create!(
    name: "ホールケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "パンダケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "チーズケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "モンブラン",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "ミルクレープ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "ミルフィーユ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "チョコレートケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "ロールケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "マカロン",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "ケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "シュークリーム",
    is_valid: [['有効', true], ['無効', false]]
  )

  Product.create!(
    name: "ショートケーキ",
    explanation: "甘くて美味しい　イチゴのショートケーキ",
    tax_out_price: "400",
    genre_id: 10,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/ケーキ3.jpg")
  )
  Product.create!(
    name: "チーズケーキ",
    explanation: "ほんのり甘酸っぱい　チーズケーキ",
    tax_out_price: "450",
    genre_id: 3,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/20130625125049.jpg")
  )
  Product.create!(
    name: "マカロン",
    explanation: "高級感のあるマカロン",
    tax_out_price: "200",
    genre_id: 9,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/59c9bb1e3c85e.jpg")
  )
  Product.create!(
    name: "ケーキ",
    explanation: "お洒落なケーキ",
    tax_out_price: "250",
    genre_id: 10,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/5e2fc3aa682c1.jpeg")
  )
  Product.create!(
    name: "ロールケーキ",
    explanation: "定番のロールケーキ　クリームには蜂蜜の隠し味",
    tax_out_price: "700",
    genre_id: 8,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/41maa3p3-fL.jpg")
  )
  Product.create!(
    name: "モンブラン",
    explanation: "みんな大好きモンブラン",
    tax_out_price: "500",
    genre_id: 4,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/get.jpeg")
  )
  Product.create!(
    name: "チョコレートケーキ",
    explanation: "ヨーロッパ伝統の本格チョコケーキ",
    tax_out_price: "600",
    genre_id: 7,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/get11.jpeg")
  )
  Product.create!(
    name: "ミルクレープ",
    explanation: "一枚一枚てやきしたクレープに濃厚な生クリームとカスタードを合わせて焼きました。",
    tax_out_price: "430",
    genre_id: 5,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/img_sizzle_millecrepes.jpg")
  )
  Product.create!(
    name: "ミルフィーユケーキ",
    explanation: "しっとりしたクリームとサクサクのパイ生地が何層にも重なったミルフィーユ",
    tax_out_price: "390",
    genre_id: 6,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/recipe-title-main-1394.jpg")
  )
  Product.create!(
    name: "チョコレートケーキ2",
    explanation: "ビターチョコを使って大人味にも変化するガトー・ショコラ",
    tax_out_price: "2600",
    genre_id: 7,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/be2fc17b17fc961ab1a3006c45853728.jpeg")
  )
  Product.create!(
    name: "パンダケーキ",
    explanation: "チョコとミルクのホイップでできた可愛いパンダケーキ",
    tax_out_price: "1500",
    genre_id: 2,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/518K-0NFZAL._AC_.jpg")
  )
  Product.create!(
    name: "パンダケーキ(フルーツ)",
    explanation: "周りはポッキー、上にはフルーツの盛り合わせにパンダをのせてみました",
    tax_out_price: "900",
    genre_id: 2,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/images.jpeg")
  )
  Product.create!(
    name: "猫のシュークリーム２個",
    explanation: "大好きな猫をシュークリームにのせて作ってみました",
    tax_out_price: "600",
    genre_id: 11,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/5ae123c3d894d.jpeg")
  )
  Product.create!(
    name: "パンダケーキ(ホール)",
    explanation: "ホールのケーキにたくさんの可愛いパンダをのせました",
    tax_out_price: "2200",
    genre_id: 2,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/mig.jpeg")
  )
  Product.create!(
    name: "ホールケーキ",
    explanation: "たくさんのクリームと美味しいイチゴを６個　誕生日などにオススメ",
    tax_out_price: "3200",
    genre_id: 1,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/ケーキ2.jpg")
  )
  Product.create!(
    name: "イチゴのホールケーキ",
    explanation: "たくさんイチゴをのせたハート型のイチゴケーキ",
    tax_out_price: "4000",
    genre_id: 1,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/ケーキ4.jpeg")
  )
  Product.create!(
    name: "チーズケーキ(ホール)",
    explanation: "とろけてしまうほどの美味しさ",
    tax_out_price: "3800",
    genre_id: 3,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/recipe_img_usual015_01.jpg")
  )
  Product.create!(
    name: "チーズケーキ",
    explanation: "とろけてしまうほどの美味しさ",
    tax_out_price: "3800",
    genre_id: 3,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/carousel_0a5bb2e9bdbd091fc6cefe314c78b6b4.jpg")
  )
  Product.create!(
    name: "いちごのチョコレートケーキ",
    explanation: "たくさんのいちごととろけるチョコレートのケーキ",
    tax_out_price: "3100",
    genre_id: 7,
    is_sale: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/ケーキ1.jpg")
  )

  10.times do |n|
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
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    customer_id: n + 1
  )
end

5.times do |n|
  Order.create!(
    customer_id: n +1,
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
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

# 20.times do |n|
#     Customer.create!(
#       email: "test#{n + 1}@test.com",
#       first_name: "名#{n + 1}",
#       last_name: "姓#{n + 1}",
#       kana_first_name: "セイ",
#       kana_last_name: "メイ",
#       password: "123456",
#       postal_code: "1234567",
#       residence: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
#       phone_number: "09012345678"
#     )
# end
