class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.string :title
      t.string :slug
      t.text :description

      t.timestamps
    end
    add_index :catalogs, :slug, unique: true
  end
end
