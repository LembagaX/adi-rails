# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(20)
#  display_name :string(20)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :role do
    name { "administrator" }
    display_name { "Administrator" }
  end
end
