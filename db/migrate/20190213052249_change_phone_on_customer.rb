class ChangePhoneOnCustomer < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :phone, :string, :limit => 17
  end

  def down
    change_column :customers, :phone, :string, :limit => 13
  end
end
