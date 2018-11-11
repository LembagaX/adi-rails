# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  name       :string(45)
#  code       :string(45)
#  stock      :integer          default(0)
#  warn_at    :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :part do
    name { "Glass Bottle 800 ml" }
    code { "GB800" }
    stock { 200 }
    warn_at { 100 }
  end
end
