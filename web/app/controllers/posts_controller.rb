class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params_req)
		if @post.save
			flash[:success] = "Post Added!"
			redirect_to @post
		else
			flash[:warning] = "Some errors were occured..."
			render "new"
		end
	end

	def index
		@post = Post.all
	end

	private def params_req
		 params.require(:post).permit(:title, :text, :author)
	end
end
