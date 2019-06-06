class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  private

  def user_params
  	params.require(:user).permit(:user_name, :profile_image_id, :profile, :email)
  end
end
