class RemoveShipDateFromSalesInvoice < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_invoices, :ship_date, :date
  end
end
