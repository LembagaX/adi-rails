class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :invoice, limit: 150
      t.integer :amount, unsigned: true
      t.string :note, limit: 255
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
