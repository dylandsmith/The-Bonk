class FavoriteController < ApplicationController
  include ActionView::RecordIdentifier 

  def new

  end

  def create
    # binding.pry
    # movie = Movie.find(favorite_params[:movie_id])
    # favorite = Favorite.find_by(user: Current.user, favoritable: movie)

    # if favorite
    #   favorite.destroy
    # else
    #   Favorite.create!(user: Current.user, favoritable: movie)
    # end

    # movie.reload

    #   render turbo_stream: turbo_stream.replace(
    #     view_context.dom_id(movie),
    #     partial: "movies/movie_table_display",
    #     locals: { movie: movie }
    #   )
    binding.pry
    if params[:fav_type] == 'movie'
      @movie = Movie.find(params[:movie_id])
      # favorite = @movie.favorites.find_by(user_id: Current.user.id)
      # if favorite
      #   favorite.destroy
      # else
      #   @movie.favorites.create!(user_id: Current.user.id)
      # end
      found = @movie.favorites.index { |f| f.user_id == params[:user_id] }
      if(!found.nil?)
        Favorite.find(@movie.favorites[found].id).destroy
        # @movie.favorites.delete(found)
      else
        @movie.favorites.create({user_id: params[:user_id]})
      end
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

  def favorite_params
    params.require(:favorite).permit(:movie_id, :fav_type, :user_id)
  end
end
