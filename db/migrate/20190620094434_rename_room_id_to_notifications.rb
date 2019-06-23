class RenameRoomIdToNotifications < ActiveRecord::Migration[5.2]
  def change
  	rename_column :notifications, :room_id, :message_id
  end
end
