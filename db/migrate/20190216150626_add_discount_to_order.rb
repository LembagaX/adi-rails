class AddDiscountToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :discount, :integer, limit: 4, default: 0
  end
end
