class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = @q.result.includes(:user).page(params[:page]).per(9)
    @users = User.all
  end

  def show
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.includes(:user)
    @user = current_user
    if user_signed_in?
      @folders = @user.folders.where(params[:folder_id])
    end
  end

  def edit
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render root_path
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
  	params.require(:post).permit(:post_title, :post_text, :main_image, :user_id )
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
