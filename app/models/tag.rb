class Tag < ActiveRecord::Base

  	belongs_to :category
  	attr_accessible :name, :category_id

	 before_save { |tag| tag.name = tag.name.downcase.capitalize}

	 validates :name, presence: true
	 validates :category_id, presence: true

 	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end

end
