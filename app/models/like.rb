class Like < ApplicationRecord
  after_save :likes_counter_update

  belongs_to :author, class_name: 'User'
  belongs_to :post

  def likes_counter_update
    post.increment!(:likes_counter)
  end
end
