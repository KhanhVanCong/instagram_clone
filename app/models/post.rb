class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes
  has_many :likers, through: :likes, source: :user

  validates :images, attached: true, content_type: /\Aimage\/.*\z/
end
