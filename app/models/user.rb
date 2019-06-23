class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :folders,  dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :active_notifications, class_name: "Notification",
                                  foreign_key: "visiter_id",
                                  dependent: :destroy
  has_many :passive_notifications, class_name: "Notification",
                                   foreign_key: "visited_id",
                                   dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  attachment :profile_image

  VALID_EMAIL = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
    validates :user_name, presence: true, length: {  maximum: 20 }
    validates :email, presence: true, length: { in: 3..25 }, format: { with: VALID_EMAIL }
    validates :profile, length: { maximum: 200 }
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end


  def create_notification_by(current_user, target)
    notification = current_user.active_notifications.new(
      visiter_id:current_user.id,
      visited_id:target[:followed_id],
      action:"follow"
    )
    notification.save if notification.valid?
  end
end













