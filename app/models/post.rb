class Post < ApplicationRecord
	belongs_to :user
	attachment :main_image
end
