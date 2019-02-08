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

Role.create! id: 1, display_name: 'Administrator'
Role.create! id: 2, display_name: 'Staff Warehouse'
Role.create! id: 3, display_name: 'Direktur Operasional'

admin       = User.create! name: "Lembagax", email: "lembagax@gmail.com", password: 'secret', role_id: Role.first.id
warehouse   = User.create! name: "Staff Warehouse", email: "warehouse@gmail.com", password: 'secret', role_id: Role.find(2).id
manager     = User.create! name: "Etty Mulyati", email: "etty@gmail.com", password: 'secret', role_id: Role.find(3).id

lkt = Provider.create! name: 'PT Langgeng Karya Teknik'
kas = Provider.create! name: 'CV Karya Abadi Sentosa'

Category.create! name: "Uncategorized"
lube    = Category.create! name: "Lubricants"
paint   = Category.create! name: "Spray Paint"

chain   = Product.create! code: 'LB11', name: 'Chain Lube A72', serial_number: '1112222111', category: lube
spray   = Product.create! code: 'PT12', name: 'Red Spray Paint', serial_number: '1113333111', category: paint

plkt    = Purchase.create! invoice: 'LKT123132', amount: 12000000, purchased_at: Time.zone.now, provider: lkt, user: warehouse
pkas    = Purchase.create! invoice: 'KAS123132', amount: 12000000, purchased_at: Time.zone.now, provider: kas, user: warehouse

a = Material.create! name: 'Rounded Can', stock: 1000
a.prices.create! amount: 5000, provider: lkt
a.prices.create! amount: 4500, provider: kas
a.providers << lkt
a.providers << kas
a.material_purchases.create! price: 5000, purchase: plkt, quantity: 1000
a.material_purchases.create! price: 4500, purchase: pkas, quantity: 1000

b = Material.create! name: 'Rectangle Can', stock: 1000
b.prices.create! amount: 5000, provider: lkt
b.prices.create! amount: 4500, provider: kas
b.providers << lkt
b.providers << kas
b.material_purchases.create! price: 5000, purchase: plkt, quantity: 1000
b.material_purchases.create! price: 4500, purchase: pkas, quantity: 1000

c = Material.create! name: 'Spray Head', stock: 1000
c.prices.create! amount: 2000, provider: lkt
c.prices.create! amount: 3000, provider: kas
c.providers << lkt
c.providers << kas
c.material_purchases.create! price: 2000, purchase: plkt, quantity: 1000
c.material_purchases.create! price: 3000, purchase: pkas, quantity: 1000

spray.assemblies.create material: a, quantity: 1
spray.assemblies.create material: c, quantity: 1

chain.assemblies.create material: b, quantity: 1
chain.assemblies.create material: c, quantity: 1