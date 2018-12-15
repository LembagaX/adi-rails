class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, limit: 20
      t.string :display_name, limit: 20

      t.timestamps
    end
  end
end
