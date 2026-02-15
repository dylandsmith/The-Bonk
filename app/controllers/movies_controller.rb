class MoviesController < ApplicationController
  require 'uri'
  require 'net/http'

  def index
  end

  def new
    @content_ratings = Movie.distinct.pluck(:content_rating)
    get_users_mentions
  end

  def create
    binding.pry
  end

  def show
    @post_struc = {}

    @movie = Movie.find_by(id: params[:id])
    @posts = @movie.posts.select{ |post| post.reply_id == 0 }

    # base case: when replies returns an empty array
    # {post: post, replies: replies[ {reply: reply, replies: replies[]}]}

    # @posts.each do |post|
    #   unless post.replies.empty?
    #     @post_struc << {post: post, replies: get_replies(post)}
    #   else 
    #     @post_struc << {post: post, replies: nil}
    #   end
    #   #get_replies(post)
    # end

    # binding.pry

    url = URI("https://moviesminidatabase.p.rapidapi.com/movie/id/#{@movie.imdb_id}/")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = 'b626dd3aecmsh32f2180eee602fep10500cjsndf563d673d38'
    request["X-RapidAPI-Host"] = 'moviesminidatabase.p.rapidapi.com'

    response = http.request(request)

    @movie_stuff = JSON.parse(response.body)["results"] ? JSON.parse(response.body)["results"] : nil
    # binding.pry
  end

  def get_replies(post)
    # binding.pry
    # until post.replies.empty? # post has replies
      # @posts_struc = {post: post, replies: post.replies}
      # does the reply have other replies
      # get_replies post
    # end

    return post.replies
  end

  def edit
  end

  def update
  end

  def delete
  end

  # add user recommended movie
  def add_recommendation
    binding.pry
    recommendation = Current.user.recommendations.new(movie_id: params[:movie_id], reason: params[:reason])
    recommendation.assign_attributes(recommendation_params)
    if recommendation.save
      
    end
  end
    private

    def recommendation_params
      params.require(:movie).permit(:title, :year, :content_rating, :plot)
    end
end