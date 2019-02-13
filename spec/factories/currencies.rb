# == Schema Information
#
# Table name: currencies
#
#  id         :bigint(8)        not null, primary key
#  code       :string(3)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :currency do
    code { "MyString" }
    user { nil }
  end
end
