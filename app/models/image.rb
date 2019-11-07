class Image < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :image_url, ImageUploader
end
