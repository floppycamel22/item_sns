class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render user_path
    end
  end

  private

  def user_params
  	params.require(:user).permit(:user_name, :profile_image, :profile, :email)
  end
end
