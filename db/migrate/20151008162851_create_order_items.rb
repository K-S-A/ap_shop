class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :roll, index: true, foreign_key: true
      t.decimal :amount_ordered, precision: 5, scale: 2
      t.decimal :price_sold, precision: 5, scale: 2
      t.string :item_comment

      t.timestamps null: false
    end
  end
end
