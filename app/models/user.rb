class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  default_scope -> { order(created_at: :desc) }
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 },
            uniqueness: { case_sensitive: false }

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end
end
