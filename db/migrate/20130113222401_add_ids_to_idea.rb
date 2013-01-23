class AddIdsToIdea < ActiveRecord::Migration
	def change
		add_column :ideas, :tag_id, :integer
		add_column :ideas, :category_id, :integer
	end
end
