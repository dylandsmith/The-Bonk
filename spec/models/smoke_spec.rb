# spec/models/smoke_spec.rb
require 'rails_helper'

RSpec.describe "Factory smoke test" do
  it "creates a user" do
    expect { create(:user) }.not_to raise_error
  end
end
