class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy

  validates :content, presence: true, length: { maximum: 50 }

  default_scope -> { order(created_at: :desc) }

  def create_notification_by(current_user, entry_users)
    entry_users.each do |entry_user|
      if entry_user[:user_id] != current_user.id
        notification = current_user.active_notifications.new(
              message_id:self.id,
              visited_id: entry_user[:user_id],
              action:"message"
            )
        notification.save if notification.valid?
      end
    end
  end
end
