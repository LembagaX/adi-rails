class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :code, limit: 3
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :currencies, :code, unique: true
  end
end
