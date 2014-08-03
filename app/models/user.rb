class User < ActiveRecord::Base
  has_many :cleaning_dates
  has_many :activities, through: :cleaning_dates

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  # Adds methods to set and authenticate against a BCrypt password.
  # This mechanism requires you to have a password_digest attribute.
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      # Using self ensures that assignment sets the user’s remember_token,
      # and as a result it will be written to the database along with the other attributes when the user is saved.
      self.remember_token = User.digest(User.new_remember_token)
    end
end
