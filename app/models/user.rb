class User < ActiveRecord::Base
	before_save { self.email.downcase! }
	validates :name, presence: true, length: { in: 4..50 }
	VALID_EMAIL_REGEX = %r{\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z}i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
