class PostsController < ApplicationController
	def not_found
		raise ActionController::RoutingError.new('Not Found')
	end

	def new
		@post = Post.new()
	end

	def show
		@post = Post.find_by_id(params[:id]) or not_found
	end

	def create
		@post = Post.new(params_req)
		if @post.save
			flash[:success] = "Post Added! Thank, dear #{@post.author}!"
			redirect_to @post
		else
			flash[:warning] = "Some errors were occured..."
			render "new"
		end
	end

	def index
		@post = Post.paginate(:page => params[:page], :per_page => 5)
	end

	private

	def params_req
		 params.require(:post).permit(:title, :text, :author, :image)
	end
end
