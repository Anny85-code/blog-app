class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )

  Comment.create(post: first_post, author: second_user, text: 'Hi Bassey!' )

  Comment.create(post: first_post, author: second_user, text: 'Hi Samuel!' )

  Comment.create(post: first_post, author: second_user, text: 'Hi Elijah!' )

  Comment.create(post: first_post, author: second_user, text: 'Hi Helen!' )

  Comment.create(post: first_post, author: second_user, text: 'Hi Eunice!' )
end
