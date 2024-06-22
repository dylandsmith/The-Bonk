class User < ApplicationRecord
    has_secure_password

    has_many :popular_flops
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :movie_posts

    has_many :mentions, as: :mentionable

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

    def find_my_mentions
      mentions = self.mentions.where(user_has_viewed: false)
      binding.pry
    end
end