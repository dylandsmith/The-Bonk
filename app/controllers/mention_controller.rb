class MentionController < ApplicationController
  def create
    user = User.find_by(handle: params[:user_mention])
    if user
      user.mentions.create(mentionable_type: 'Comment')
    end
  end

  def find_mentions(user)
  end
end
