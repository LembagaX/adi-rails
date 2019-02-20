class CreateJoinTableAdvertiseCatalog < ActiveRecord::Migration[5.2]
  def change
    create_join_table :advertises, :catalogs do |t|
      t.references :advertise, foreign_key: true
      t.references :catalog, foreign_key: true
    end
  end
end
