# == Schema Information
#
# Table name: announcements
#
#  id         :bigint(8)        not null, primary key
#  message    :string
#  due        :date
#  color      :integer
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :announcement do
    message { "MyString" }
    due { "2019-02-21" }
    type { 1 }
    user { nil }
  end
end
