class AddDueToSalesInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_invoices, :due, :date
  end
end
