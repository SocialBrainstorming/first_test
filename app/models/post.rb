class Post < ActiveRecord::Base
	attr_accessible :date, :title, :user_id

	before_save :create_remember_token

	has_many :messages, dependent: :destroy
	
	belongs_to :user

	validates :title, presence: true
	validates :user_id, presence: true

	default_scope order: 'posts.created_at DESC'

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
