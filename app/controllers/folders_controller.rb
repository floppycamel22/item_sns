class FoldersController < ApplicationController

	def show
		@folder = Folder.find(params[:id])
		@folder_items = @folder.folder_items
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
		@folder = Folder.find(params[:id])
		@folder.destroy
		redirect_to root_path
	end

	private

	def folder_params
		params.require(:folder).permit(:folder_name, :user_id)
	end
end