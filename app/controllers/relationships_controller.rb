class RelationshipsController < ApplicationController
	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user)
		target = Relationship.where(follower_id: current_user).order(:created_at).last
		@user.create_notification_by(current_user, target)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow(@user)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
end