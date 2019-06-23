module NotificationsHelper

	def notification_form(notification)
	  @comment = nil
	  	visiter = link_to notification.visiter.user_name, user_path(notification.visiter.id), style:"font-weight: bold;"
	  case notification.action
	  	when "message" then
	    	"#{visiter}さんがメッセージを送りしました"
	    when "follow" then
	      	"#{visiter}さんがあなたをフォローしました"
	    when "favorite" then
	    	your_post = link_to 'あなたの投稿', post_path(notification.post.id), style:"font-weight: bold;"
	      	"#{visiter}さんが#{your_post}にいいね！しました"
	    when "post_comment" then
	    	your_post = link_to 'あなたの投稿', post_path(notification.post.id), style:"font-weight: bold;"
	      	"#{visiter}さんが#{your_post}にコメントしました"
	  end
	end

	def unchecked_notifications
	    @notifications = current_user.passive_notifications.where(checked: false)
	end
end
