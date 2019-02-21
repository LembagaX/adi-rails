
first   = Purchase.create! id: 1, invoice: 'LKT123132', amount: 11000000, purchased_at: Time.zone.now, provider: Provider.find(1), user: User.find(2)
second  = Purchase.create! id: 2, invoice: 'KAS123132', amount: 13000000, purchased_at: Time.zone.now, provider: Provider.find(2), user: User.find(2)

rc = Material.create! name: 'Rounded Can', stock: 1000
rc.providers << Provider.find(1)
rc.providers << Provider.find(2)
rc.material_purchases.create! price: 5000, purchase: first, quantity: 1000
rc.material_purchases.create! price: 600, purchase: second, quantity: 1000
rc.prices.create! amount: 5000, provider: Provider.find(1)
rc.prices.create! amount: 6000, provider: Provider.find(2)

tc = Material.create! name: 'Rectangle Can', stock: 1000
tc.providers << Provider.find(1)
tc.providers << Provider.find(2)
tc.material_purchases.create! price: 5000, purchase: first, quantity: 1000
tc.material_purchases.create! price: 6000, purchase: second, quantity: 1000
tc.prices.create! amount: 5000, provider: Provider.find(1)
tc.prices.create! amount: 6000, provider: Provider.find(2)

sh = Material.create! name: 'Spray Head', stock: 1000
sh.providers << Provider.find(1)
sh.providers << Provider.find(2)
sh.material_purchases.create! price: 1000, purchase: first, quantity: 1000
sh.material_purchases.create! price: 1000, purchase: second, quantity: 1000
sh.prices.create! amount: 1000, provider: Provider.find(1)
sh.prices.create! amount: 1000, provider: Provider.find(2)
