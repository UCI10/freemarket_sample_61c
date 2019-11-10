class User < ApplicationRecord

# before_save { self.email = email.downcase }
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, {presence: true, , format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_one :card
  has_many :products


  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,                 presence: true, length:{maximum: 255}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, on: :validates_step1
  validates :nickname,              presence: true, length: {maximum: 20}, on: :validates_step1
  validates :password,              presence: true, length: {minimum: 7, maxinum: 128}, on: :validates_step1
  validates :password_confirmation, presence: true, length: {minimum: 7, maxinum: 128}, on: :validates_step1
  validates :last_name,             presence: true, on: :validates_step1
  validates :first_name,            presence: true, on: :validates_step1
  validates :last_name_phonetic,    presence: true, on: :validates_step1
  validates :first_name_phonetic,   presence: true, on: :validates_step1
  validates :birth_year,            presence: true, on: :validates_step1
  validates :birth_month,           presence: true, on: :validates_step1 
  validates :birth_day,             presence: true, on: :validates_step1
  
  validates :phone_number,          presence: true, on: :validates_step2

end
