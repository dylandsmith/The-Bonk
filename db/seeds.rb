# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'csv'
require 'uri'
require 'net/http'

csv_text = File.read("app/assets/movie_flops.csv")
flops = CSV.parse(csv_text, headers: false, encoding: "ISO-8859-1")

flops.each do |flop|
  # get imdb id's
  url = URI("https://moviesminidatabase.p.rapidapi.com/movie/imdb_id/byTitle/#{ERB::Util.url_encode(flop[0])}/")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = 'b626dd3aecmsh32f2180eee602fep10500cjsndf563d673d38'
  request["X-RapidAPI-Host"] = 'moviesminidatabase.p.rapidapi.com'

  response = http.request(request)
  imdb_id = JSON.parse(response.body)["results"][0] ? JSON.parse(response.body)["results"][0]["imdb_id"] : nil

  if flop[2].to_s.index('-')
      m = Movie.new(
        title: flop[0].to_s, 
        year_released: flop[1].to_s, 
        budget: flop[2].slice(flop[2].index('-')+1..flop[2].size), 
        worldwide_gross: flop[3].to_s.slice(flop[3].to_s.index('$')+1..flop[3].to_s.size), 
        imdb_id: imdb_id)
      m.save()
  elsif flop[2].to_s.index('$')
      m2 = Movie.new(
        title: flop[0].to_s, 
        year_released: flop[1].to_s, 
        budget: flop[2].to_s.slice(flop[2].to_s.index('$')+1..flop[2].to_s.size), 
        worldwide_gross: flop[3].to_s.slice(flop[3].to_s.index('$')+1..flop[3].to_s.size), 
        imdb_id: imdb_id)
      m2.save()
  end

  # get more information about each movie from IMDB database
  url = URI("https://moviesminidatabase.p.rapidapi.com/movie/id/#{imdb_id}/")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = 'b626dd3aecmsh32f2180eee602fep10500cjsndf563d673d38'
  request["X-RapidAPI-Host"] = 'moviesminidatabase.p.rapidapi.com'

  response = http.request(request)
  data = JSON.parse(response.body)["results"] ? JSON.parse(response.body)["results"] : nil

  unless data.nil?
    movie = Movie.find_by(imdb_id: imdb_id)
    movie.description = data["description"]
    movie.content_rating = data["content_rating"]
    movie.movie_length = data["movie_length"]
    movie.rating = data["rating"]
    movie.trailer = data["trailer"]
    movie.plot = data["plot"]
    movie.banner = data["banner"]
    movie.save
  end

end