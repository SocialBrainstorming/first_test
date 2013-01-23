class User < ActiveRecord::Base
	attr_accessible :username, :email, :password, :password_confirmation
	has_secure_password

	before_save { |user| user.email = user.email.downcase } 
	before_save :create_remember_token

	validates :username, presence: true
	VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
	validates :email,    presence: true, format: { with: VALID_EMAIL_REGEX}
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	has_many :posts, dependent: :destroy
	has_many :messages, dependent: :destroy

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
