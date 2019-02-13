# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  name       :string(45)
#  phone      :string(17)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint(8)
#

class Customer < ApplicationRecord
    has_many :addresses, dependent: :destroy
    belongs_to :address, optional: true

    validates_presence_of :name
    validates_length_of :name, within: 6..45

    validates_presence_of :phone
    validates_length_of :phone, within: 8..17
    validates_format_of :phone, with: /^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$/, multiline: true

    def default_address
        address
    end

    def default_address= address
        update address: address
    end
end
