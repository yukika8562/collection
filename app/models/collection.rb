class Collection < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_collection, through: :favorites, source: :user
end
