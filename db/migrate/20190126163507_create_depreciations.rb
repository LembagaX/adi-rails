class CreateDepreciations < ActiveRecord::Migration[5.2]
  def change
    create_table :depreciations do |t|
      t.string :note, limit: 255
      t.integer :amount
      t.integer :quantity
      t.references :provider, foreign_key: true
      t.references :material, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
