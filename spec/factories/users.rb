# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string(45)
#  email           :string(45)
#  password_digest :string(72)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  secret          :string(60)
#  role_id         :bigint(8)
#

FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password  }
    role_id { Role.first.id }
  end
end
