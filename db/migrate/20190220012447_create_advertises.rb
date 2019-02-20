class CreateAdvertises < ActiveRecord::Migration[5.2]
  def change
    create_table :advertises do |t|
      t.text :description
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
