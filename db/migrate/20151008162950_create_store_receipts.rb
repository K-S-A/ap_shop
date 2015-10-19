class CreateStoreReceipts < ActiveRecord::Migration
  def change
    create_table :store_receipts do |t|
      t.references :order_item, index: true, foreign_key: true
      t.decimal :receipt_amount, precision: 5, scale: 2
      t.date :receipt_date

      t.timestamps null: false
    end
  end
end
