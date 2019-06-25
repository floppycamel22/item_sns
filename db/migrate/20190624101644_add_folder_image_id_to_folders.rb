class AddFolderImageIdToFolders < ActiveRecord::Migration[5.2]
  def change
    add_column :folders, :folder_image_id, :string
  end
end
