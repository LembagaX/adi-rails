class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :code, limit: 10
      t.string :name, limit: 60
      t.string :serial_number, limit: 15
      t.integer :price
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :products, :code, unique: true
  end
end
