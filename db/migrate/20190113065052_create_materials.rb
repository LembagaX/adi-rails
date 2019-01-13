class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name,   limit: 120
      t.string :slug,   limit: 120
      t.integer :stock,   unsigned: true

      t.timestamps
    end
    add_index :materials, :slug, unique: true
  end
end
