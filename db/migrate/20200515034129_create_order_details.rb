class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :subprice
      t.integer :produciton_status, default: 0, null: false
      t.timestamps
    end
  end
end
