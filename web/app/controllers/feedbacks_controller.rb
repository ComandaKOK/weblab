class FeedbacksController < ApplicationController
  def new
  	@feed = Feedback.new()
  end

  def index
  	@feed = Feedback.all
  end

  def create
  	@feed = Feedback.new(feed_params)
  	if @feed.save
  		redirect_to allnews_path
  		flash[:success] = "Feedback recived! Thank you!"
  	else
  		render 'new'
  	end
  end

  def show
  	@feed = Feedback.find(params[:id])
  end

  private def feed_params
  	params.require(:feedback).permit(:author, :email, :text)
  end
end
