# == Schema Information
#
# Table name: depreciations
#
#  id          :integer          not null, primary key
#  note        :string(255)
#  amount      :integer
#  quantity    :integer
#  provider_id :integer
#  material_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Depreciation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
