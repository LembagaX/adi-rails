# == Schema Information
#
# Table name: advertises
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  product_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

FactoryBot.define do
  factory :advertise do
    description { "MyText" }
    product { nil }
  end
end
