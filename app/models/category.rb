class Category < ApplicationRecord
  has_many :products
  has_many :category_sizes
  has_many :products_sizes, through: :category_sizes
  has_ancestry
end
