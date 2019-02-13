# == Schema Information
#
# Table name: materials
#
#  id         :bigint(8)        not null, primary key
#  name       :string(120)
#  slug       :string(120)
#  stock      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :material do
    name { "MyString" }
    slug { "MyString" }
    stock { 1 }
  end
end
