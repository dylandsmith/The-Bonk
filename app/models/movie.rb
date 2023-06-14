class Movie < ApplicationRecord

  has_one :popular_flop
  has_many :comments, as: :commentable
  
  def self.search_movies query
    result = Movie.where("title LIKE '%#{query}%'")
  end
  
end
