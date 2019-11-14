class Product < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  belongs_to :category , optional: true
  belongs_to :brand  ,optional: true
  belongs_to :size_type, optional: true

  accepts_nested_attributes_for :images
  validates :title,:description, presence: true

  enum condition:         ["新品、未使用","未使用に近い","目立った傷や汚れなし","やや傷や汚れあり","傷や汚れあり","全体的に状態が悪い"]
  enum shipping_burden:  ["送料込み(出品者負担)","着払い(購入者負担)"]
  enum shipping_period:     ["1~2日で発送","2~3日で発送","4~7日で発送"]
  enum shipping_method:   ["未定","クロネコヤマト","ゆうパック","ゆうメール"]
  enum size:              ["XXS以下","XS(SS)","S","M","L","XL(LL)","2XL(3L)","3XL(4L)","4XL(5L)以上","FREE SIZE"]
  
end
