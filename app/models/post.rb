class Post < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :folder_items, dependent: :destroy
	attachment :main_image

	def favorited_by?(user)
		if user.present?
			favorites.where(user_id: user.id).exists?
		else
			false
		end
	end
end
