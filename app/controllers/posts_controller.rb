class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@idea = Idea.new
		@tags = Tag.all
		@categories = Category.all
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create

		@idea = Idea.new (params[:idea])

		@tags = Tag.all
		@categories = Category.all

		if @idea.save
			@post = current_user.posts.build(:title=>params[:idea][:title])

			if @post.save
				Message.create(:text=>params[:idea][:text], :user_id=>current_user.id, :post_id=>@post.id, :is_description=>true, :message_id=> -1)
				flash[:success] = "Post created"
				redirect_to @post
			else
				render 'new'
			end
		else
			render 'new'
		end
	end

	def update
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		if signed_in?
			redirect_to current_user
		else
			redirect_to root_path
		end
	end
end
