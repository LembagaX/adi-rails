class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 45
      t.string :email, limit: 45
      t.string :password_digest, limit: 72

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
