class User < ActiveRecord::Base
  has_many :cleaning_dates
  has_many :activities, through: :cleaning_dates

  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  # Adds methods to set and authenticate against a BCrypt password.
  # This mechanism requires you to have a password_digest attribute.
  has_secure_password
  validates :password, length: { minimum: 6 }
end
