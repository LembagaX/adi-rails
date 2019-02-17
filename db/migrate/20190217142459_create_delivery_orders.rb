class CreateDeliveryOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_orders do |t|
      t.integer :number, limit: 4
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
