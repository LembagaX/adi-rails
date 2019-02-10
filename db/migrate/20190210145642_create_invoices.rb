class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :number, limit: 16
      t.integer :termin, limit: 2
      t.belongs_to :currency, foreign_key: true

      t.timestamps
    end
  end
end
