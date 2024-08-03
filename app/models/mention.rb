class Mention < ApplicationRecord

  def create_mention(user_id)
    user = User.find_by(id: user_id)
    if user
      user.mentions.create(mentionable_type: 'Comment', user_has_viewed: false)
    end
  end

end
