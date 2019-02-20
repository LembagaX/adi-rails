# == Schema Information
#
# Table name: advertises
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  product_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Advertise < ApplicationRecord
  mount_base64_uploader :image, AdvertiseUploader
  belongs_to :product
  validates_presence_of :description

  def image_url
    image
  end
end
