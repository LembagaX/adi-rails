User.destroy_all
Role.destroy_all
Provider.destroy_all
Material.destroy_all
Purchase.destroy_all
Price.destroy_all

if Rails.env.development?
  Role.create id: 1, display_name: 'Administrator'
  Role.create id: 2, display_name: 'Staff Warehouse'
  Role.create id: 3, display_name: 'Direktur Operasional'
  User.create name: "Lembagax", email: "lembagax@gmail.com", password: 'secret', role_id: Role.first.id
  User.create name: "Staff Warehouse", email: "warehouse@gmail.com", password: 'secret', role_id: Role.find(2).id
  User.create name: "Etty Mulyati", email: "etty@gmail.com", password: 'secret', role_id: Role.find(3).id
end
