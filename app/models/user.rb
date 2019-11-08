class User < ApplicationRecord


  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true,  format: { with: VALID_EMAIL_REGEX }


# before_save { self.email = email.downcase }

# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, {presence: true, , format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_one :card

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,                 presence: true, length:{maximum: 255}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, on: :validates_step1
  validates :nickname,              presence: true, length: {maximum: 20}, on: :validates_step1
  # validates :email,                 presence: true, length:{maximum: 255}, uniqueness: true, on: :validates_step1
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


  # def email_custom_error
  #   if email.blank?
  #       errors[:base] = "メールアドレスを入力してください"
  #   elsif email.length > 255
  #       errors[:base] = "メールアドレスは255文字以内で入力してください"
  #   elsif email.match(VALID_EMAIL_REGEX) == nil
  #       errors[:base] = "メールアドレスが不正です"
  #   end
  # end



end
