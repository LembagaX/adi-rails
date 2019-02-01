class CreateManufactures < ActiveRecord::Migration[5.2]
  def change
    create_table :manufactures do |t|
      t.references :user, foreign_key: true
      t.string :code, limit: 16

      t.timestamps
    end
    add_index :manufactures, :code, unique: true
  end
end
