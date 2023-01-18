class Post < ApplicationRecord
  belongs_to :user

  has_many_attached :images
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :comments

  validates :images, attached: true, content_type: /\Aimage\/.*\z/
end
