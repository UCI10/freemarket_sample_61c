class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefectures
  belongs_to :user, optional: true

  # VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validates :email,                 presence: true, length:{maximum: 255}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, on: :validates_step1
  # step1入力項目
  validates :postalcode,            presence: true
  validates :prefectures,           presence: true
  validates :city,                  presence: true
  validates :house_number,          presence: true
end
