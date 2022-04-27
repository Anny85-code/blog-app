require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "Should get the index of the post from the user" do
      get '/users/5/posts/6/'
      expect(response).to have_http_status(200)
    end
  end
end
