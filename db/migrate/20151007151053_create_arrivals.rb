class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.references :roll, index: true, foreign_key: true
      t.date :arrival_date
      t.decimal :total, precision: 5, scale: 2
      t.string :info

      t.timestamps null: false
    end
  end
end
