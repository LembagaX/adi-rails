# == Schema Information
#
# Table name: announcements
#
#  id         :bigint(8)        not null, primary key
#  message    :string
#  due        :date
#  color      :integer
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Announcement < ApplicationRecord
  enum type: ["info", "success", "warning", "danger"]
  belongs_to :user

  validates_presence_of :message
  validates_length_of :message, :within => 6..255

  validates_presence_of :color

  validates_presence_of :due
end
