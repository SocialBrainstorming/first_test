class TagsController < ApplicationController
	# GET /tags
	def index
		@tags = Tag.all
	end

	# GET /tags/1
	def show
		@tag = Tag.find(params[:id])
	end

	# GET /tags/new
	def new
		@tag = Tag.new
		@category = Category.all
	end

	# GET /tags/1/edit
	def edit
		@tag = Tag.find(params[:id])
	end

	# POST /tags
	def create
		@tag = Tag.new(params[:tag])
		if @tag.save
			flash[:success] = "Welcome to the Social Brainstorming!"
			redirect_to '/tags_list'
		else
			render 'new'
		end
	end

	# PUT /tags/1
	def update
		@tag = Tag.find(params[:id])
	end

	# DELETE /tags/1
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

	end

	def list_tags

		@category= Category.all
		@category_count = Category.all.count  / 6;
	end
end
