class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, limit: 45
      t.string :phone, limit: 13

      t.timestamps
    end
  end
end
