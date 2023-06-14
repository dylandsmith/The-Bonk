class PopularFlop < ApplicationRecord
  has_many :users
  has_one :movie

  def self.popular_flops
    @flop_ids = PopularFlop.connection.select_all("SELECT movie_id, COUNT(movie_id) flop_count FROM popular_flops GROUP BY movie_id ORDER BY movie_id ASC").to_a.map{ |x| x["movie_id"] }
    # @popular_flops = Movie.connection.select_all("SELECT * FROM movies WHERE id IN (#{@flop_ids.join(',')})").rows
    @popular_flops = Movie.find(@flop_ids)
  end
end