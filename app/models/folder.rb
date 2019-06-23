class Folder < ApplicationRecord
	belongs_to :user
	has_many :folder_items, dependent: :destroy

	validates :folder_name, presence: true, length: { maximum: 20 }
end
