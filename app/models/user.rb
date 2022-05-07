class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true }

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
