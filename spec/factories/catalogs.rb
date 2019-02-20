# == Schema Information
#
# Table name: catalogs
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  slug        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :catalog do
    title { "MyString" }
    slug { "MyString" }
    description { "MyText" }
  end
end
