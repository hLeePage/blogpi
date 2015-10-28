require 'request_helper'

RSpec.describe "posts" do
  describe "#index" do
    it "doesn't crash" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end
end
