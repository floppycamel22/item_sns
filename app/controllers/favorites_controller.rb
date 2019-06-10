class FavoritesController < ApplicationController

	before_action :set_post

	def create
		favorite = current_user.favorites.new(post_id: params[:post_id])
		favorite.save
		if params[:from]
			redirect_to post_path(params[:post_id])
		else
			redirect_to posts_path
		end
	end

	def destroy
        favorite = current_user.favorites.find_by(post_id: params[:post_id])
        favorite.destroy
        if params[:from]
			redirect_to post_path(params[:post_id])
		else
			redirect_to posts_path
		end
	end

	private

	def set_post
		post = Post.find(params[:post_id])
	end
end
