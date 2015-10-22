class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      @error = "Oops, something wrong!"
      render 'edit'
    end
  end

  def feedlist
    @feed = Feedback.where(author: current_user.name)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :back
#    redirect_to users_url
  end

private

  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url
    end
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
end
