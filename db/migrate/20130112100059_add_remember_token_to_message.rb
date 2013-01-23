class AddRememberTokenToMessage < ActiveRecord::Migration
	def change
		add_column 	:messages, :remember_token, :string
		add_index		:messages, :remember_token
	end
end
