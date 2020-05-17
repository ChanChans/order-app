# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
    Admin.create!(
      email: "test#{n + 1}@test.com",
      first_name: "姓#{n + 1}",
      last_neme: "名#{n + 1}",
      kana_first_name: "セイ#{n + 1}",
      kana_last_neme: "メイ#{n + 1}",
      encrypted_password: "",
      postal_code: "123456" ,
      residence: "テスト#{n + 1}",
      phone_number: "09012345678"
    )
  end
