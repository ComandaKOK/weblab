class FeedbacksController < ApplicationController
  def new
  	@feedback = Feedback.new()
  end

  def index
    @feedback = Feedback.all
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.adminanswer = "No answer"
    if signed_in?
      @feedback.author = current_user.name
      @feedback.email  = current_user.email
    end  

  	if @feedback.save
  		redirect_to allnews_path
  	else
  		render 'new'
  	end
  end

  def show
  	@feedback = Feedback.find(params[:id])
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])
    @feedback.adminview = true
    if @feedback.update_attributes(feedback_params)
      redirect_to root_path
    else
      @error = "Oops, something wrong!"
      render 'edit'
    end
  end

  def destroy
    Feedback.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def feedback_params
  	params.require(:feedback).permit(:author, :email, :text, :adminanswer)
  end
end
