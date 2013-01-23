class Category < ActiveRecord::Base

  	has_many :tags
  	attr_accessible :name

	before_save { |category| category.name = category.name.downcase.capitalize}

	validates :name, presence: true
end
