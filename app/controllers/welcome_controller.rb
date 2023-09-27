class WelcomeController < ApplicationController

  @@search_results = []

  before_action :get_popular_flops
  
  def index
    if @@search_results.empty?
      @movies = Movie.includes(@posts).all
    else
      @movies = @@search_results
    end
  end

  def get_popular_flops
    @popular_flops = PopularFlop.popular_flops
  end

  def search_movies
    @@search_results = Movie.search_movies(params[:query])
    # redirect_to request.referrer
  end

  def clear_search
    @@search_results = []
  end

end
