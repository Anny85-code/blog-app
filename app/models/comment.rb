class Comment < ApplicationRecord

  after_save :comment_counter_update

  belongs_to :author, class_name: 'User'
  belongs_to :post
end

def comment_counter_update
   post.increment!(:posts_counter)
end
# Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )

  # Comment.create(post_id: 1, author_id: 2, text: 'Hi Bassey!' )

  # Comment.create(post_id: 1, author_id: 2, text: 'Hi Samuel!' )

  # Comment.create(post_id: 1, author_id: 2, text: 'Hi Elijah!' )

  # Comment.create(post_id: 1, author_id: 2, text: 'Hi Helen!' )

  # Comment.create(post_id: 1, author_id: 2, text: 'Hi Eunice!' )