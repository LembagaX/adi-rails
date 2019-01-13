# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string(120)
#  slug       :string(120)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Provider, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
