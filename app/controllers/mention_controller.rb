class MentionController < ApplicationController
  def create
    user = User.find_by(handle: params[:user_mention])
    if user
      user.mentions.create(mentionable_type: 'Comment', user_has_viewed: false)
    end
  end
end
