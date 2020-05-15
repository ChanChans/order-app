class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :postal_code
      t.string :name
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method
      t.integer :order_status
      t.timestamps
    end
  end
end
