class Post < ApplicationRecord
  after_save :post_increment

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def recent_comments
  comments.order('created_at Desc').limit(5)
end

  private

  def post_increment
    author.increment!(:posts_counter)
  end
end
