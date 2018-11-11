User.destroy_all
Part.destroy_all

if Rails.env.development?
  User.create name: "Lembagax", email: "lembagax@gmail.com", password: 'secret'
  FactoryBot.create :part, id: 1
end
