class PostsController < ApplicationController

 

  def index

  end

  # GET /examples/new
  def new
    @post = Post.new
  end

  def create
    if(params[:comment_type] == 'comment')
      # binding.pry
      @post = Post.new({user_id: Current.user.id, movie_id: params[:movie_id], reply_id: 0, title: params[:comment_title], body: params[:comment_body], handle: params[:mention]})
      # @mention = Mention.new()
      # @mention.create_mention(Current.user.id)
    else
      @post = Post.new({user_id: Current.user.id, movie_id: params[:movie_id], reply_id: params[:parent_id], title: params[:comment_title], body: params[:comment_body], handle: params[:mention]})
    end

    respond_to do |format|
      if @post.save
        # format.html { redirect_back(fallback_location: movie_path(id: params[:movie_id]), notice: "User was successfully updated.") }
        # binding.pry
        # @post.mentions.create({user_id: Current.user.id})
        format.html { redirect_to movie_path(id: params[:movie_id]), turbolinks: false, notice: "Post was successfully created." }
        # format.json { render :show, status: :created, location: @post }
        # format.js { render inline: "location.reload();" }
        # format.html { redirect_to request.referrer, notice: "User was successfully WHATEVER." }

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
