class Movie < ApplicationRecord

  has_one :popular_flop
  has_many :posts, dependent: :destroy
  has_many :favorites, as: :favoritable
  has_many :favorited_users, through: :favorites, source: :user
  
  scope :search, ->(query) {
    return all if query.blank?
    where("title ILIKE ?", "%#{query}%")
  }

  # def self.search_movies query
  #   result = Movie.where("title LIKE '%#{query}%'")
  # end

  def favorited_by?(user)
    return false unless user
    favorites.any? { |f| f.user_id == user.id }
  end

end
