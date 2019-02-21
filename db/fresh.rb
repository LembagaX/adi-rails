Announcement.delete_all
Catalog.all.each do |catalog|
  catalog.advertises.each do |advertise|
    catalog.advertises.destroy advertise
  end
end
Advertise.delete_all
Catalog.delete_all
SalesInvoice.delete_all
DeliveryOrder.delete_all
Invoice.delete_all
Cart.delete_all
Order.delete_all
Customer.update address_id: nil
Address.delete_all
Customer.delete_all
Currency.delete_all
Assembly.delete_all
Depreciation.delete_all
Manifest.delete_all
MaterialPurchase.delete_all
Price.delete_all
Manufacture.delete_all
Purchase.delete_all
Material.all.each do |material|
    material.providers.delete_all
end
Material.delete_all
Provider.delete_all
Product.delete_all
Category.delete_all
User.delete_all
Role.delete_all
