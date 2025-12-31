class SearchMoviesController < ApplicationController
  def index
    @movies =
      if params[:query].present?
        Favorite
          .where(favoritable_type: "Movie")
          .joins("INNER JOIN movies ON movies.id = favorites.favoritable_id")
          .where("LOWER(movies.title) LIKE LOWER(?)", "%#{params[:query]}%")
      else
        Favorite.none
      end
  end
end
