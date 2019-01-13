class CreateJoinTableMaterialProvider < ActiveRecord::Migration[5.2]
  def change
    create_join_table :materials, :providers do |t|
      t.references :material, foreign_key: true
      t.references :provider, foreign_key: true
    end
  end
end
