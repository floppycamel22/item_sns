class NotificationsController < ApplicationController

	before_action :authenticate_user!

	def index
    	@notifications = current_user.passive_notifications.includes(:visiter, :post).page(params[:page]).per(9)
    	@notifications.where(checked: false).includes(:visited).each do |notification|
			notification.update_attributes(checked: true)
	    end
  	end
end
