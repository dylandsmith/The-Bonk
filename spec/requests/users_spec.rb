require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let!(:users) { create_list(:user, 3) }
    it "returns a successful response" do
      get users_path, as: :json
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json.size).to eq(3)
    end
  end

  describe "GET/user/:id" do
    let!(:user) { create(:user) }

    it "returns a successful response" do
      get user_path(user)
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:email]).to eq(user.email)
    end
  end
end