class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, limit: 60
      t.string :slug, limit: 60

      t.timestamps
    end
    add_index :categories, :slug, unique: true
  end
end
