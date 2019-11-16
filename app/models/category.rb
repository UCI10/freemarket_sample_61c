class Category < ApplicationRecord
  has_many :products
  has_many :sizes
  has_many :size_types, through: :sizes
  has_ancestry
end
