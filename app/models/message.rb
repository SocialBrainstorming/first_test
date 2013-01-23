class Message < ActiveRecord::Base
	attr_accessible :text, :user_id, :post_id, :message_id, :is_description

	before_save :create_remember_token

	belongs_to :post
	belongs_to :user
	belongs_to :message
	has_many :messages

	validates :text, presence: true
	validates :user_id, presence: true
	validates :post_id, presence: true
	validates :message_id, presence: true

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
