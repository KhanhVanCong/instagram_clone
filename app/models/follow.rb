class Follow < ApplicationRecord
  before_create :check_privacy
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true, uniqueness: { scope: :followed_id }

  def accept
    self.update(accepted: true)
  end

  private
    def check_privacy
      self.accepted = true unless self.followed.private
    end
end
