class Micropost < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :comments,  dependent: :destroy
  has_one_attached :image
  scope :newest, -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                                    size: { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }

  def display_image
    self.image
  end
end
