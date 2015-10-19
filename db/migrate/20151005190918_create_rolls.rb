class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.string :suffix
      t.string :location
      t.text :comment

      t.references :textile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
