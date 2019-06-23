class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :folder_list, :edit, :user_favorites,
                                  :update, :following, :followers, :set_entry]
  before_action :set_entry, only: [:show, :folder_list, :user_favorites, :following, :followers]

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.page(params[:page]).per(9)
  end

  def folder_list
    @folder_list = @user.folders
  end

  def edit
  end

  def user_favorites
    @favorites = @user.favorites.page(params[:page]).per(9)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render user_path(@user.id)
    end
  end

  def following
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
  	params.require(:user).permit(:user_name, :profile_image, :profile, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_entry
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

end