class User < ActiveRecord::Base
	before_save { email.downcase! }

  has_secure_password
	validates :name, presence: true, length: { in: 4..50 }
	VALID_EMAIL_REGEX = %r{\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z}i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..18 }
end
