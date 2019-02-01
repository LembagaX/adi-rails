class CreateAssemblies < ActiveRecord::Migration[5.2]
  def change
    create_table :assemblies do |t|
      t.references :product, foreign_key: true
      t.references :material, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
