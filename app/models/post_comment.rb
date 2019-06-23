class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :notifications, dependent: :destroy
  validates :comment, presence: true, length: { maximum: 120 }

	def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      post_comment_id:self.id,
      post_id: post.id,
      visited_id:self.post.user.id,
      action:"post_comment"
    )
    notification.save if notification.valid?
  end
end
