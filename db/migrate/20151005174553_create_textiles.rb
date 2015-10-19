class CreateTextiles < ActiveRecord::Migration
  def change
    create_table :textiles do |t|
      t.string :code
      t.string :name
      t.string :country
      t.string :manufacturer
      t.string :man_code
      t.integer :height
      t.string :units
      t.decimal :price, precision: 5, scale: 2
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
