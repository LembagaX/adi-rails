# == Schema Information
#
# Table name: manufactures
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  code       :string(16)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :manufacture do
    user { nil }
    code { "MyString" }
  end
end
