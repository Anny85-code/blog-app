class Comment < ApplicationRecord
  after_save :comment_counter_update

  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def comment_counter_update
    post.increment!(:comments_counter)
  end
end
