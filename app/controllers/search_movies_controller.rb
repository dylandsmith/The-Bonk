class SearchMoviesController < ApplicationController
  def index
    keyword = "%#{params[:query]}%"
    @movies = Movie.where("title ILIKE ?", keyword)
    # @movies =
    #   if params[:query].present?
    #     Favorite
    #       .where(favoritable_type: "Movie")
    #       .joins("INNER JOIN movies ON movies.id = favorites.favoritable_id")
    #       .where("LOWER(movies.title) LIKE LOWER(?)", "%#{params[:query]}%")
    #   else
    #     Favorite.none
    #   end
    # binding.pry
  end
end
