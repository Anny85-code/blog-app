require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'Should get the index of the post from the user' do
      get '/users/5/posts/6/'
      expect(response).to have_http_status(200)
    end

    it "renders 'posts' template" do
      get '/users/5/posts'
      expect(response).to render_template(:index)
    end

    it "renders 'posts' show template" do
      get '/users/5/posts/6'
      expect(response).to render_template(:show)
    end

    it "renders 'posts' index page content" do
      get '/users/5/posts'
      expect(response.body).to include('Here is a list of posts for a given user')
    end

    it "renders 'posts' show page content" do
      get '/users/5/posts/6'
      expect(response.body).to include('Will display details of a single post')
    end
  end
end
