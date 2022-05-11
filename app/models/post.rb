class Post < ApplicationRecord
  after_save :post_increment

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates_associated :author
  validates_presence_of :author_id
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }

  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def post_increment
    author.increment!(:post_counter)
  end
end
