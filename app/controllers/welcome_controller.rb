class WelcomeController < ApplicationController

  @@search_results = []

  before_action :get_popular_flops
  
  def index
    if @@search_results.empty?
      @movies = Movie.includes(@posts).all
    else
      @movies = @@search_results
    end

    get_users_mentions
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

  private

    # def get_users_mentions
    #   if Current.user
    #     @posts = Post.where(mentions: Mention.where(user_id: Current.user.id))
    #     # @mentions = Current.user.mentions.where(user_has_viewed: false)
    #   end
    # end

end
