class AddProviderToPrice < ActiveRecord::Migration[5.2]
  def change
    add_reference :prices, :provider, foreign_key: true
  end
end
