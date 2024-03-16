class Movie < ApplicationRecord

  has_one :popular_flop
  #has_many :comments, as: :commentable
  has_many :posts
  has_many :favorites, as: :favoritable
  #has_many :comments
  #has_many :movie_posts
  
  def self.search_movies query
    result = Movie.where("title LIKE '%#{query}%'")
  end
  
end
