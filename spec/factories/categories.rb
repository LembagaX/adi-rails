# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(60)
#  slug       :string(60)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :category do
    name { "MyString" }
    slug { "MyString" }
  end
end
