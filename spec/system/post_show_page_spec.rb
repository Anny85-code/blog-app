require 'rails_helper'

RSpec.describe 'Testing posts/show page', type: :feature do
  describe 'current user post session test' do
    before(:each) do
      @user1 = User.create(name: 'Bright', photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                           bio: 'Full stack from Silicon Valley.', email: 'bright@gmail.com',
                           password: 'brightsecret', confirmed_at: Time.now, post_counter: 0)
      @user2 = User.create(name: 'Okon', photo: 'photo', bio: 'Musician from Nigeria.', email: 'oko@gmail.com',
                           password: 'oksecret', confirmed_at: Time.now, post_counter: 0)
      @user3 = User.create(name: 'Mabel', photo: 'photo', bio: 'Physicist from Russia.', email: 'mabel@gmail.com',
                           password: 'mabsecret', confirmed_at: Time.now, post_counter: 0)
      @post1 = Post.create(title: 'Testing with capybara', text: 'test for views', author_id: @user1.id)
      @post2 = Post.create(title: 'Testing post-index page', text: 'test for views post-index page',
                           author_id: @user1.id)
      @coment1 = Comment.create(text: ' test comment 1', author_id: @user1.id, post_id: @post1.id)
      @coment2 = Comment.create(text: ' test comment 2', author_id: @user3.id, post_id: @post1.id)
      @coment3 = Comment.create(text: ' test comment 3', author_id: @user2.id, post_id: @post1.id)
      @like = Like.create(author_id: @user2.id, post_id: @post1.id)
      @like = Like.create(author_id: @user1.id, post_id: @post1.id)
      @like = Like.create(author_id: @user2.id, post_id: @post1.id)

      visit user_session_path

      fill_in 'Email',	with: @user1.email
      fill_in 'Password',	with: @user1.password
      click_button 'Log in'

      visit user_posts_path user_id: @user1.id
    end

    scenario 'if user can see own name' do
      expect(page).to have_content 'Bright'
    end

    scenario 'if user can see number of posts of other users.' do
      expect(page).to have_content 'Number of Posts: 2'
    end

    scenario 'if user can see post title' do
      expect(page).to have_content 'Testing with capybara'
    end

    scenario 'if user can see post text' do
      expect(page).to have_content 'test for views'
    end

    scenario 'if user can see posts count' do
      expect(page).to have_content 'Comments: 3'
    end

    scenario 'if user can see likes count' do
      expect(page).to have_content 'Likes: 3'
    end

    scenario 'if page has link' do
      expect(page.has_link?('See all users')).to be true
    end

    scenario 'I can see the user profile.' do
      expect(page.first('img')['src']).to have_content 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png'
    end

    it "if I click on a post, it redirects me to that post's show page." do
      click_link(@post1.title)
      expect(current_path).to eq user_post_path user_id: @user1.id, id: @post1.id
    end
  end
end