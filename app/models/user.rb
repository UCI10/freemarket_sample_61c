class User < ApplicationRecord

# before_save { self.email = email.downcase }
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, {presence: true, , format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

         def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
      
          unless user
        
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              nickname:     auth.info.name,
              email:    User.dummy_email(auth),
              password: Devise.friendly_token[0, 20],
              phone_number: " ",
              birth_year: " ",
              birth_month: " ",
              birth_day: " ",
              first_name: " ",
              last_name: " ",
              first_name_phonetic: " ",
              last_name_phonetic: " "
            
            )
          end
      
          user
        end
      
        private
      
        def self.dummy_email(auth)
          "#{auth.uid}-#{auth.provider}@example.com"
        end

  has_one :address
  has_one :card
  has_many :products


  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,                 presence: true, length:{maximum: 255}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, on: [:validates_step1,]
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
