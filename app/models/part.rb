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

class Part < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :code
  validates_length_of :name, :within => 3..45
  validates_length_of :code, :within => 3..45
  validates_numericality_of :stock, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 8388607
  validates_numericality_of :warn_at, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 127

  def warnable?
    warn_at != 0
  end

  def under_limit?
    if warnable?
      stock < warn_at
    else
      raise NoMethodError
    end
  end
end
