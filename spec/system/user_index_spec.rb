require 'rails_helper'
# rubocop:disable :all
RSpec.feature 'Tests for user-index page', type: :feature do
  describe 'user#index' do
    before(:each) do
      User.destroy_all
      @user1 = User.create(name: 'Samuel', photo: 'https://photo.png',
                           bio: 'Teacher from Namibia.', email: 'sam@gmail.com',
                           password: '3456secret', confirmed_at: Time.now, post_counter: 0, role: 'admin')
      @user2 = User.create(name: 'Bassey', photo: 'https://photo.png',
                           bio: 'Teacher from Senegal.', email: 'bb@gmail.com',
                           password: 'nurisecret', confirmed_at: Time.now, post_counter: 0)
      @user3 = User.create(name: 'Rachid', photo: 'https://static.toiimg.com/thumb/resizemode-4,msid-76729750,imgsize-249247,width-720/76729750.jpg',
                           bio: 'Teacher from Mexico.', email: 'rachid@gmail.com',
                           password: 'rachidsecret', confirmed_at: Time.now, post_counter: 0)
      @post = Post.create(title: 'Testing post-index page', text: 'test for views post-index page',
                          author_id: @user2.id)
      @post = Post.create(title: 'Testing post-index page', text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(title: 'Testing post-index page', text: 'test for views post-index page',
                          author_id: @user3.id)
      @post = Post.create(title: 'Testing post-index page', text: 'test for views post-index page',
                          author_id: @user3.id)
      visit user_session_path

      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password

        click_button 'Log in'
      end
    end

    scenario 'if user see their names and names of other users' do
      expect(page).to have_content 'Samuel'
      expect(page).to have_content 'Bassey'
      expect(page).to have_content 'Rachid'
    end

    scenario 'I can see the number of posts each user has written.' do
      expect(page).to have_content 'Number of Posts: 1'
      expect(page).to have_content 'Number of Posts: 2'
    end

    scenario 'I can see the profile picture for each user.' do
      expect(page.first('img')['src']).to have_content 'photo.png'
    end

    scenario "if I click on a user, I am redirected to that user's show page" do
      click_on 'Samuel', match: :first
      expect(current_path).to eq user_path @user1.id
    end
  end
end
