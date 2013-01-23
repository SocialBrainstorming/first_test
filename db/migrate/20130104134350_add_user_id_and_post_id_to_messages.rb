class AddUserIdAndPostIdToMessages < ActiveRecord::Migration
	def change
		add_column :messages, :user_id, :integer
		add_column :messages, :post_id, :integer
	end
end
