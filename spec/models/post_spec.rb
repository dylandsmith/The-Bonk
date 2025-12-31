require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with valid attributes" do
    user = create(:user)
    movie = create(:movie)
    post = Post.new(user_id: user.id, movie_id: movie.id, title: "Hello", body: "This is a post")
    expect(post).to be_valid
  end
end