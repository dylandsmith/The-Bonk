class Movie < ApplicationRecord

  def self.search_movies query
    result = Movie.where("title LIKE '%#{query}%'")
  end
  
end
