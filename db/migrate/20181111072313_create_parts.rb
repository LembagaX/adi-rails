class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :name, limit: 45
      t.string :code, limit: 45
      t.integer :stock, limit: 3, default: 0
      t.integer :warn_at, limit: 1  , default: 0

      t.timestamps
    end
    add_index :parts, :code, unique: true
  end
end
