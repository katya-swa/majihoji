class Item < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 200 }
  validates :picture, presence: true
  validate  :picture_size
  mount_uploader :picture, PictureUploader

  private

  def picture_size
    errors.add(:picture, "5MB以下にしてください") if picture.size > 5.megabytes
  end
end
