class FavoriteController < ApplicationController

  def new

  end

  def create
    binding.pry
    if params[:fav_type] == 'movie'
      @movie = Movie.find(params[:movie_id])
      favorite = @movie.favorites.find_by(user_id: Current.user.id)
      if favorite
        favorite.destroy
      else
        @movie.favorites.create!(user_id: Current.user.id)
      end
      # found = @movie.favorites.index { |f| f.user_id == params[:user_id] }
      # if(!found.nil?)
      #   Favorite.find(@movie.favorites[found].id).destroy
      #   # @movie.favorites.delete(found)
      # else
      #   @movie.favorites.create({user_id: params[:user_id]})
      # end
      respond_to do |format|
        if @movie.save
          # format.html { redirect_back(fallback_location: movie_path(id: params[:movie_id]), notice: "User was successfully updated.") }
          format.html { redirect_to root_path(id: params[:movie_id]), turbolinks: false, notice: "Post was successfully created." }
          # format.json { render :show, status: :created, location: @post }
          # format.js { render inline: "location.reload();" }
          # format.html { redirect_to request.referrer, notice: "User was successfully WHATEVER." }
  
        else 
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      # binding.pry
      # respond_to do |format|
      #   if @post.save
      #     # format.html { redirect_back(fallback_location: movie_path(id: params[:movie_id]), notice: "User was successfully updated.") }
      #     format.html { redirect_to movie_path(id: params[:movie_id]), turbolinks: false, notice: "Post was successfully created." }
      #     # format.json { render :show, status: :created, location: @post }
      #     # format.js { render inline: "location.reload();" }
      #     # format.html { redirect_to request.referrer, notice: "User was successfully WHATEVER." }
  
      #   else
      #     format.html { render :new, status: :unprocessable_entity }
      #     format.json { render json: @post.errors, status: :unprocessable_entity }
      #   end
      # end
    end
  end
end
