# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  name       :string(45)
#  code       :string(45)
#  stock      :integer          default(0)
#  warn_at    :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Part, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :code }

  it { should validate_length_of(:name).is_at_least(3).is_at_most(45) }
  it { should validate_length_of(:code).is_at_least(3).is_at_most(45) }
  it { should validate_numericality_of(:stock).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(8388607) }
  it { should validate_numericality_of(:warn_at).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(127) }
end
