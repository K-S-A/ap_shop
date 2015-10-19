class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :customer
      t.string :customer_phone
      t.string :status
      t.string :order_comment

      t.timestamps null: false
    end
  end
end
