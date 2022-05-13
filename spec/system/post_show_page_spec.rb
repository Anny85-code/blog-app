require 'rails_helper'

RSpec.feature 'Tests for post/show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Samuel', photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                        bio: 'Developer from Mexico.', email: 'sam@gmail.com',
                        password: 'samsecret', confirmed_at: Time.now, post_counter: 0, role: 'admin')
    Post.create(title: 'Testing1 with capybara', text: 'test for views', author_id: @user.id)
    Comment.create(text: 'This is a good capybara', author: User.first, post: Post.first)
    visit user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit "/users/#{User.first.id}/posts"
    end
  end

  scenario 'if users in post/show page can see their name' do
    expect(page).to have_content 'Samuel'
  end

  scenario 'if users in post/show page can see their posts title' do
    expect(page).to have_content 'Testing1 with capybara'
  end

  scenario 'if users can see the author of the comment ' do
    expect(page).to have_content('Samuel')
  end
end

RSpec.feature 'Tests for post/show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Samuel', photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                        bio: 'Developer from Mexico.', email: 'sam@gmail.com',
                        password: 'samsecret', confirmed_at: Time.now, post_counter: 0, role: 'admin')
    Post.create(title: 'Testing1 with capybara', text: 'test for views', author_id: @user.id)
    Comment.create(text: 'This is a good capybara', author: User.first, post: Post.first)
    visit user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit "/users/#{User.first.id}/posts"
    end
  end

  scenario 'if users can see the number of comments ' do
    expect(page).to have_content('Comments: 1')
  end

  scenario 'if users can see the number of likes ' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'if users can see the body of post ' do
    expect(page).to have_content('test for views')
  end

  scenario 'if users can see the body of the comment ' do
    expect(page).to have_content('This is a good capybara')
  end
end
