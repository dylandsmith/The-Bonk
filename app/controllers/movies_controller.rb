class MoviesController < ApplicationController
  require 'uri'
  require 'net/http'

  def index
  end

  def new
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @posts = @movie.posts.select{ |post| post.reply_id == 0 }

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

  def edit
  end

  def update
  end

  def delete
  end

end