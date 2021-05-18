class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                   uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :collections
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :collection
  
  def favorite(collection)
    self.favorites.find_or_create_by(collection_id: collection.id)
  end
  
  def unfavorite(collection)
    favorite = self.favorites.find_by(collection_id: collection.id)
    favorite.destroy if favorite
  end
  
  def favorite?(collection)
    self.likes.include?(collection)
  end
end
