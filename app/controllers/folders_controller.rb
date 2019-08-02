class FoldersController < ApplicationController

	before_action :set_folder, only: [:show, :destroy, :edit]

	def show
		@folder_items = @folder.folder_items.includes(post: :user).page(params[:page]).per(9)
	end

	def new
		@folder = Folder.new
		@user = current_user
	end

	def edit
	end

	def create
		@folder = Folder.new(folder_params)
		@folder.user_id = current_user.id
		@folder.save
		redirect_to  folder_path(@folder.id)
	end

	def destroy
		@folder.destroy
		redirect_to posts_path
	end

	private

	def folder_params
		params.require(:folder).permit(:folder_name, :user_id, :folder_image)
	end

	def set_folder
		@folder = Folder.find(params[:id])
	end
end