require 'rails_helper'
​
RSpec.feature 'Tests for user/show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Samuel', photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                        bio: 'Developer from Mexico.', email: 'sam@gmail.com',
                        password: 'samsecret', confirmed_at: Time.now, post_counter: 0, role: 'admin')
    Post.create(title: 'Testing1 with capybara', text: 'test for views', author_id: @user.id)
    Post.create(title: 'Testing2 with capybara', text: 'test for views', author_id: @user.id)
    Post.create(title: 'Testing3 with capybara', text: 'test for views', author_id: @user.id)
    Post.create(title: 'Testing4 with capybara', text: 'test for views', author_id: @user.id)
    visit user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    visit user_path  @user.id
​
    end
  end
​
  scenario 'if users in user/show page can see their name' do
    
    expect(page).to have_content 'Samuel'
  end
​
  scenario 'if users in user/show page can see their posts' do
    
    expect(page).to have_content 'Wrote 4 Posts'
  end
​
  scenario 'if users can see their Bio ' do
    
    expect(page).to have_content @user.bio
  end
​
  scenario 'I can see the user profile picture' do
    expect(page.first('img')['src']).to have_content 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png'
  end
​
  scenario ' I can see the user 3 posts in desc order.' do
    expect(page).to have_content 'Testing2 with capybara'
    expect(page).to have_content 'Testing3 with capybara'
    expect(page).to have_content 'Testing4 with capybara'
    expect(page).to_not have_content 'Testing1 with capybara'
  end
​
  scenario 'if redirect to the user_post_index page when you click on a see all posts.' do
​
    click_link('See all posts')
    expect(current_path).to eq "/users/#{User.first.id}/posts"
  end
end
