class Movie < ApplicationRecord

  has_one :popular_flop
  #has_many :comments, as: :commentable
  has_many :posts, dependent: :destroy
  has_many :favorites, as: :favoritable
  has_many :favorited_users, through: :favorites, source: :user

  #has_many :comments
  #has_many :movie_posts
  
  def self.search_movies query
    result = Movie.where("title LIKE '%#{query}%'")
  end
  
  def favorited_by?(user)
    user && favorited_users.exists?(user.id)
  end
  # def favorited_by?(user)
  #   favorites.exists?(user: user)
  # end
end
