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

  setup do
    @part = create(:part)
  end

  it 'warnable? true if Part.warn_at != 0' do
    expect(@part.warnable?).to be true
    @part.update warn_at: 0
    @part.reload
    expect(@part.warnable?).to be false
  end

  it 'under_limit? true if Part.stock < Part.warn_at and raise error if not warnable?' do
    expect(@part.under_limit?).to be false
    @part.update stock: 50, warn_at: 100
    @part.reload
    expect(@part.under_limit?).to be true
    @part.update warn_at: 0
    @part.reload
    expect {
      @part.under_limit?
    }.to raise_error NoMethodError
  end
end
