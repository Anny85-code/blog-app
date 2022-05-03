class Post < ApplicationRecord
  after_save :post_increment

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  private

  def post_increment
    author.increment!(:posts_counter)
  end
end

# first_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my first post')
  
#   first_post = Post.create(author_id: 1, title: 'Hi', text: 'This is my second post')
  
#   first_post = Post.create(author_id: 1, title: 'Sup', text: 'This is my third post')
  
#   first_post = Post.create(author_id: 1, title: 'Hey', text: 'This is my fourth post')
