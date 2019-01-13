# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string(120)
#  slug       :string(120)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :provider do
    name { "MyString" }
    slug { "MyString" }
  end
end
