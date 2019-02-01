# == Schema Information
#
# Table name: assemblies
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  material_id :integer
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Assembly, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
