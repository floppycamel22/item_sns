class FolderItemsController < ApplicationController

	def create
		@folder = Folder.find(params[:folder_id])
		@post = Post.find(params[:post_id])
		@folder_item = FolderItem.new(post_id: params[:post_id])
		@user = current_user
		@folder_item.folder_id = @folder.id
		@folder_item.save
		redirect_to folder_path(@folder.id)
	end

	private

	def folder_params
		params.require(:folder).permit(:folder_name, :user_id)
	end

	def folder_item_params
		params.require(:folder_item).permit(:folder_id, :post_id)
	end
end