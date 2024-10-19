class Post < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  has_many :replies, class_name: :Post, foreign_key: :reply_id
  has_many :favorites, as: :favoritable
  # belongs_to :comment, class_name: :Post

  has_many :mentions, as: :mentionable

  after_create :create_mention

   private

    def create_mention()
      user = User.find_by(handle: self.handle)
      if user
        user.mentions.create(user_has_viewed: false)
      end

      self.mentions.create({user_id: user.id})
    end
end
