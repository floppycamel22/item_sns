class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts
  attachment :profile_image

  validates :user_name, presence: true, length: {  maximum: 20 }
  validates :email, presence: true, length: { in: 3..25 }
end
