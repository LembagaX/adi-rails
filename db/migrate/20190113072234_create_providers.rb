class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name, limit: 120
      t.string :slug, limit: 120

      t.timestamps
    end
    add_index :providers, :slug, unique: true
  end
end
