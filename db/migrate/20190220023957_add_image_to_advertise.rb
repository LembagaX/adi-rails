class AddImageToAdvertise < ActiveRecord::Migration[5.2]
  def change
    add_column :advertises, :image, :string
  end
end
