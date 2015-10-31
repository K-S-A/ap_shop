class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :number
      t.string :customer
      t.string :customer_phone
      t.string :status
      t.string :order_comment
      t.decimal :prepay, precision: 8, scale: 2
      t.decimal :discount, precision: 6, scale: 2

      t.timestamps null: false
    end
  end
end
