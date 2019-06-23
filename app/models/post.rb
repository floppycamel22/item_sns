class Post < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :folder_items, dependent: :destroy
	has_many :notifications, dependent: :destroy
	attachment :main_image
	validates :post_title, presence: true, length: { maximum: 25 }
	validates :post_text, presence: true
	validates :main_image_id, presence: true

	default_scope -> { order(created_at: :desc) }

	def favorited_by?(user)
		if user.present?
			favorites.where(user_id: user.id).exists?
		else
			false
		end
	end

	def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      post_id: self.id,
      visited_id: self.user.id,
      action:"favorite"
    )
    notification.save if notification.valid?
  	end
end
