class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :images, attached: true, content_type: /\Aimage\/.*\z/
end
