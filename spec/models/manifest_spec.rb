# == Schema Information
#
# Table name: manifests
#
#  id             :integer          not null, primary key
#  manufacture_id :integer
#  product_id     :integer
#  quantity       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Manifest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
