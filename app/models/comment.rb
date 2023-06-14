class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  belongs_to :user
  belongs_to :movie
  has_many :comments, as: :commentable
end
