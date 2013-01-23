class MessagesController < ApplicationController

	def index
		@messages = Message.all
	end

	def show
		@message = Message.find(params[:id])
	end

	def new
		@message = Message.new

		#coming from a message reply
		if params[:message]
			@father_message = Message.find_by_remember_token(params[:message])
		else 
			@father_message = nil
		end

		@post = Post.find_by_remember_token(params[:post])

		#coming from a post reply
		if params[:from_post]
			messages = @post.messages
			messages.each do |msg|

				if msg.is_description
					@father_message = Message.find_by_remember_token(msg.remember_token)
					break;
				end
			end
		end
	end

	def edit
		@message = Message.find(params[:id])
	end

	def create
		@post = Post.find_by_remember_token(params[:message][:token])
		@father_message = Message.find_by_remember_token(params[:message][:token_message])
		params[:message][:user_id] = @post.user_id
		params[:message][:message_id] = @father_message.id
		params[:message][:is_description] = false
		params[:message].delete :token
		params[:message].delete :token_message
		@message = @post.messages.build(params[:message])

		if @message.save
			flash[:success] = "Message created"
			redirect_to @message
		else
			render 'new'
		end
	end

	def update
		@message = Message.find(params[:id])
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		redirect_to root_path
	end
end
