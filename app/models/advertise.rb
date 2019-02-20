# == Schema Information
#
# Table name: advertises
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  product_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Advertise < ApplicationRecord
  belongs_to :product

  validates_presence_of :description
end
