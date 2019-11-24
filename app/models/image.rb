class Image < ApplicationRecord
  belongs_to :product, optional: true, inverse_of: :images
  mount_uploader :image_url, ImageUploader

  validates_presence_of :product

  validates  :image_url,  presence: true
  validates  :product_id,  presence: true

  # validates :product, presence: true
end

