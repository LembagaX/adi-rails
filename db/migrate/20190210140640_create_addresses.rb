class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address, limit: 120
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
