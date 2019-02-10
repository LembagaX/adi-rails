# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(45)
#  phone      :string(13)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
    validates_presence_of :name
    validates_length_of :name, within: 6..45

    validates_presence_of :phone
    validates_length_of :phone, within: 8..13
end
