class MoviePostController < ApplicationController
  before_action :get_user, only: %i[ create ]


  # POST /examples or /examples.json
  def create
    user_id = @user.id
    movie_id = params[:movie_id]
    post_hash = {user_id: Current.user.id, movie_id: params[:movie_id]}.merge(movie_post_params)
    # @movie_post = MoviePost.new(movie_post_params)
    binding.pry
    respond_to do |format|
      if @movie_post.save
        binding.pry
        format.html { redirect_to example_url(@movie_post), notice: "Example was successfully created." }
        format.json { render :show, status: :created, location: @movie_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_post.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def get_user
      @user = Current.user
    end
    # Only allow a list of trusted parameters through.
    def movie_post_params
      params.require(:movie_post).permit(:title, :body)
    end
end
