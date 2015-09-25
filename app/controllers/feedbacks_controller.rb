class FeedbacksController < ApplicationController
  def new
  	@feedback = Feedback.new()
  end

  def index
  	@feedback = Feedback.all
  end

  def create
  	@feedback = Feedback.new(feedback_params)
  	if @feedback.save
  		redirect_to allnews_path
  		flash[:success] = "Feedback recived! Thank you, #{@feedback.author}!"
  	else
  		render 'new'
  	end
  end

  def show
  	@feedback = Feedback.find(params[:id])
  end

  private

  def feedback_params
  	params.require(:feedback).permit(:author, :email, :text)
  end
end
