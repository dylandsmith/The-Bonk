class WelcomeController < ApplicationController

  @@search_results = []

  def index
    if @@search_results.empty?
      @movies = Movie.all
    else
      @movies = @@search_results
    end
  end

  def search_movies
    @@search_results = Movie.search_movies(params[:query])
    # redirect_to request.referrer
  end

  def clear_search
    @@search_results = []
  end

end
