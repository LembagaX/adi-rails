# == Schema Information
#
# Table name: manufactures
#
#  id         :integer          not null, primary key
#  user_id    :integer
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
