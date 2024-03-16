class User < ApplicationRecord
    has_secure_password

    has_many :popular_flops
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :favorites
    has_many :movie_posts

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
