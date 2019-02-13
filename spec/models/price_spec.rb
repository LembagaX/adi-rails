# == Schema Information
#
# Table name: prices
#
#  id          :bigint(8)        not null, primary key
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :bigint(8)
#  provider_id :bigint(8)
#

require 'rails_helper'

RSpec.describe Price, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
