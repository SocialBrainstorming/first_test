module PostsHelper

	def description_message

		@post.messages.all.each do |message|

			if message.is_description
				return message.text
			end
		end
	end

	def from_description?(message)

		if message.message_id > 0			
			Message.find_by_id(message.message_id).is_description
		else
			false
		end
	end
	
end
