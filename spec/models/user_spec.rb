require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invaid without a password" do
    user.password = nil
    expect(user).not_to be_valid
  end

  it "is invali with incorrect password confirmation" do
    user.password_confirmation = 'something_else'
    expect(user).not_to be_valid
  end
end