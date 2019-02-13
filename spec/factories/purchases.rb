# == Schema Information
#
# Table name: purchases
#
#  id           :bigint(8)        not null, primary key
#  invoice      :string(150)
#  amount       :integer
#  note         :string(255)
#  purchased_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  provider_id  :bigint(8)
#  user_id      :bigint(8)
#

FactoryBot.define do
  factory :purchase do
    invoice { "MyString" }
    amount { 1 }
    note { "MyString" }
    purchased_at { "" }
  end
end
