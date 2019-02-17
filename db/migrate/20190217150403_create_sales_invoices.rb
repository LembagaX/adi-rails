class CreateSalesInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_invoices do |t|
      t.date :ship_date
      t.string :number, limit: 13
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
