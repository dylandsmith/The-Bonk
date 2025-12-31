class WelcomeController < ApplicationController

  @@search_results = []

  #before_action :get_popular_flops
  
  def index
    # binding.pry
    if @@search_results.empty?
      if Current.user
        @user_favorites = Current.user.favorites
        # @user_favorites = []
        get_users_mentions
      else
        @popular_flops = []
        @popular_flops_hash = {}
        @popular_flops = Favorite.all.uniq { |f| f.favoritable_id }
      end
      @movies = Movie.includes(@posts).all
    else
      @movies = @@search_results
    end
  end

  def get_user_favorites
    # binding.pry
    @user_favorites = Current.user.favorites
    respond_to do |format|
      format.json { render json: { movies: @user_favorites } }
      # Optional: Handle other formats like HTML if needed
      format.html { render :index }
    end
    # binding.pry
    # render :json => @popular_flops
  end

  def get_popular_flops_json
    # binding.pry
    @popular_flops_json = []
    Favorite.all.each{|f| @popular_flops_json.push(f)}
    respond_to do |format|
      format.json { render json: { movies: @popular_flops_json } }
      # Optional: Handle other formats like HTML if needed
      format.html { render :index }
    end
    # return @popular_flops_json
    # render :json => @popular_flops_json
    # binding.pry
    # render partial: 'movies/movie_table_display', locals: {movies: @popular_flops_json}, layout: false
  end

  def get_popular_flops # this is the action name
    # binding.pry
    @user_favorites = []
    Favorite.all.each{|f| @user_favorites.push(f)} 
    
    render partial: "movies/tabbed_content", locals: { movies: @user_favorites }

    # respond_to do |format|
    #   format.js {render partial: 'movies/movie_table_display'}
    #   # format.html { render 'index'} # I had to tell rails to use the index by default if it's a html request. 
    # end
  end

  def search_movies
    # binding.pry
    @@search_results = Movie.search_movies(params[:query])
    @popular_flops = []
    @popular_flops_hash = {}
    @popular_flops = Favorite.all.uniq { |f| f.favoritable_id }
    get_users_mentions
    render :index
  end

  def clear_search
    @@search_results = []
  end

  def recommendations
    # binding.pry
    @content_ratings = Movie.distinct.pluck(:content_rating)
    get_users_mentions
    render partial: "movies/tabbed_content", locals: { movies: 'recommendations' }

  end

  private

    # def get_users_mentions
    #   if Current.user
    #     @posts = Post.where(mentions: Mention.where(user_id: Current.user.id))
    #     # @mentions = Current.user.mentions.where(user_has_viewed: false)
    #   end
    # end

end
