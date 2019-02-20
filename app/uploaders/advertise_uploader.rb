class AdvertiseUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
