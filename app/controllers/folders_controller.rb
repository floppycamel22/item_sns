class FoldersController < ApplicationController

	before_action :set_folder, only: [:show, :create, :destroy]

	def show
		@folder_items = @folder.folder_items.page(params[:page]).per(9)
	end

	def new
		@folder = Folder.new
		@user = current_user
	end

	def create
		@folder = Folder.new(folder_params)
		@folder.user_id = current_user.id
		@folder.save
		# redirect_to  post_folder_path(@folder.id)
		redirect_to root_path
	end

	def destroy
		@folder.destroy
		redirect_to root_path
	end

	private

	def folder_params
		params.require(:folder).permit(:folder_name, :user_id)
	end

	def set_folder
		@folder = Folder.find(params[:id])
	end
end