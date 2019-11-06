class Product < ApplicationRecord
  belongs_to :category 
  has_many :images, dependent: :destroy
  belongs_to :user
  
end
