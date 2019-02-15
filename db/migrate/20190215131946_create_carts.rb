class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.belongs_to :order, foreign_key: true, limit: 4
      t.belongs_to :product, foreign_key: true, limit: 4
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
