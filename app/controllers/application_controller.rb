class ApplicationController < ActionController::Base
  before_action :set_current_user
  # geting this error -> Can't verify CSRF token authenticity.
  protect_from_forgery unless: -> { request.format.json? }

  def set_current_user
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
      redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
  end

  def get_users_mentions
    # binding.pry
    if Current.user
      binding.pry
      @posts = Post.where(mentions: Mention.where(user_id: Current.user.id))
      # @mentions = Current.user.mentions.where(user_has_viewed: false)
    end
  end
end
