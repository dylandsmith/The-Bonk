class Mention < ApplicationRecord

  belongs_to :mentionable, polymorphic: true

  # belongs_to :post
  # belongs_to :user

  def create_mention(user_id)
    user = User.find_by(id: user_id)
    if user
      user.mentions.create(user_has_viewed: false)
      # user.mentions.create(mentionable_type: 'Comment', user_has_viewed: false)
    end
  end

end
