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

require 'rails_helper'

RSpec.describe Advertise, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
