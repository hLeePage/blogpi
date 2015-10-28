require 'request_helper'

RSpec.describe "posts" do
  describe "#index" do
    it "shows posts" do
      Post.create!(title: "My Post", body: "important things")
      get posts_path
      expect(response).to have_http_status(:success)
      expect(json.count).to eq 1
    end
  end
end
