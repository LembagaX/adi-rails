User.destroy_all
Role.destroy_all

if Rails.env.development?
  Role.create id: 1, display_name: 'Administrator'
  User.create name: "Lembagax", email: "lembagax@gmail.com", password: 'secret', role_id: Role.first.id
end
