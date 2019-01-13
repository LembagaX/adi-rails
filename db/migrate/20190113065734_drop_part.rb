class DropPart < ActiveRecord::Migration[5.2]
  def change
    drop_table :parts
  end
end
