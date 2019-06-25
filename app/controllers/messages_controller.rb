class MessagesController < ApplicationController

	before_action :authenticate_user!, :only => [:create]

  	def create
	    if  Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
			@message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
			target_room = Entry.where(user_id: current_user.id).order(:created_at).last
			entry_users = Entry.where(room_id: target_room[:room_id])
			@message.create_notification_by(current_user, entry_users)
			redirect_to "/rooms/#{@message.room_id}"
	    else
			redirect_back(fallback_location: root_path)
	    end
  	end
end
