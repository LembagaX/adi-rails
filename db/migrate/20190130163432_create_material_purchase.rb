class CreateMaterialPurchase < ActiveRecord::Migration[5.2]
  def change
    create_table :material_purchases do |t|
      t.references :material, foreign_key: true
      t.references :purchase, foreign_key: true
      t.integer :price
      t.integer :quantity
    end
  end
end
