class Idea < ActiveRecord::Base
	attr_accessible :text, :title, :category_id, :tag_id

	validates :text, presence: true
	validates :title, presence: true
end
