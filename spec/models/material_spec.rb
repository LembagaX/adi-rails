# == Schema Information
#
# Table name: materials
#
#  id         :bigint(8)        not null, primary key
#  name       :string(120)
#  slug       :string(120)
#  stock      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Material, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
