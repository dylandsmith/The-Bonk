class PostsController < ApplicationController

  def index
    binding.pry

  end

  # GET /examples/new
  def new
    binding.pry
    @post = Post.new
  end

  def create
    @post = Post.new({user_id: Current.user.id, movie_id: params[:movie_id], title: params[:comment_title], body: params[:comment_body]})
    # user = Current.user.id
    # binding.pry
    respond_to do |format|
      if @post.save
        format.html { redirect_to example_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def post_params
      params.require(:post).permit(:movie, :user, :title, :body)
    end
end
