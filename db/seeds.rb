User.destroy_all

if Rails.env.development?
  User.create name: "Lembagax", email: "lembagax@gmail.com", password: 'secret'
end
