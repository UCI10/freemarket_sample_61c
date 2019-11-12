class Card < ApplicationRecord
  belongs_to :user, optional: true

  validates :card_id,            presence: true
  validates :year,               presence: true
  validates :month,              presence: true
  validates :security_code,       presence: true

end
