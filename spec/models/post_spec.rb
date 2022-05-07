require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject {Post.new(title: title.length <= 250, comment_counter: comment_counter >= 0, like_counter: like_counter >= 0)}
  # let(user = User.new(name:"Anny", post_counter: 1))

  # subject.save
  it "Title must not be blank" do
    subject.title = nil
    expect(subject).to_not be_valid
end

  it "Title must not exceed 250 characters" do
    subject.title.length <= 250
    expect(subject).to be <= 250
end

it "Comment counter must be an integer greater than or equal to zero" do
subject.comment_counter.value >= 0
expect(subject).to be >= 0
  
end

it "Like counter must be an integer greater than or equal to zero " do
  subject.like_counter.value >= 0
  expect(subject).to be >= 0  
  
end


end

