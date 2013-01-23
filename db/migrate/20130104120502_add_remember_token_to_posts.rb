class AddRememberTokenToPosts < ActiveRecord::Migration
	def change
		add_column 	:posts, :remember_token, :string
		add_index		:posts, :remember_token
	end
end
