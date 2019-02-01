# == Schema Information
#
# Table name: manufactures
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  code       :string(16)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Manufacture < ApplicationRecord
  before_create :build_code
  
  belongs_to :user

  def build_code
    first   = Time.current.strftime '%d%m%Y'
    start   = Time.current.beginning_of_month
    stop    = Time.current.at_end_of_month
    mans    = Manufacture.where(created_at: (start..stop)).count
    offset  = '0' * (6 - mans.to_s.length)
    role    = '02'
    self.code = first + offset + (mans + 1).to_s + role
  end
  
  private
  def save_code
    self.code = self.friendly_id
  end
  
end
