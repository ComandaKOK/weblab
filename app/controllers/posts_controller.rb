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
		if signed_in?
			@post.author = current_user.name
		end

		if @post.save
			redirect_to @post
		else
			render "new"
		end
	end

	def edit
    	@post = Post.find(params[:id])
  	end

    def update
    	@post = Post.find(params[:id])
    	if @post.update_attributes(params_req)
      		redirect_to @post
    	else
     		@error = "Oops, something wrong!"
      		render 'edit'
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
