require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users#index' do
    it 'should get the index of the user' do
      get '/users/5/'
      expect(response).to have_http_status(200)
    end

    it "renders 'users' template" do
      get '/users'
      expect(response).to render_template(:index)
    end

    it "renders 'users' show template" do
      get '/users/6'
      expect(response).to render_template(:show)
    end

    it "renders 'users' index page content" do
      get '/users'
      expect(response.body).to include('This displays lists of users')
    end

    it "renders 'users' show page content" do
      get '/users/6'
      expect(response.body).to include('This will display the details for a single user')
    end
  end
end
