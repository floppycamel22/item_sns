class RoomsController < ApplicationController

  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).includes(:user).present?
      @messages = @room.messages.includes(:user).page(params[:page]).per(5)
      @message = Message.new
      @entries = @room.entries.includes(:user)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
