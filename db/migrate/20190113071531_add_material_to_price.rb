class AddMaterialToPrice < ActiveRecord::Migration[5.2]
  def change
    add_reference :prices, :material, foreign_key: true
  end
end
