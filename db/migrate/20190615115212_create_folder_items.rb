class CreateFolderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :folder_items do |t|
      t.integer :folder_id
      t.integer :post_id

      t.timestamps
    end
  end
end
