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

  describe "#create" do
    it "creates and returns a post" do
      payload = {
        post: {
          title: "My Title",
          body: "content"
        }
      }
      post posts_path, payload
      expect(response).to have_http_status(:created)
      expect(json["title"]).to eq "My Title"
    end

    it "rejects when missing title" do
      payload = {
        post: {
          title: "",
          body: "content"
        }
      }
      post posts_path, payload
      expect(response).to have_http_status(:bad_request)
      expect(json).to_not be_empty
    end
  end
end
