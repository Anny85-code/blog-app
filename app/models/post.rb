class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
  
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
  
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
  
  
end
