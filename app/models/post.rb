class Post < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  has_many :replies, class_name: :Post, foreign_key: :reply_id
  # belongs_to :comment, class_name: :Post
end
