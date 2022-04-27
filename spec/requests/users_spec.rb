require 'rails_helper'

# RSpec.describe "Users", type: :request do
#   describe "GET /users" do
#     it "works! (users)" do
#       get users_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end


 RSpec.describe "Users", type: :request do

      describe "GET users#index" do
        it "should get index" do
          get '/users/5/'
          # get users_index_path
          expect(response).to have_http_status(200)
        end
      end

    end