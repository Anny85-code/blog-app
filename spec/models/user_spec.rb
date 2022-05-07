require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject {User.new(name:"Anny", post_counter: 1 )}
  # let(user = User.new(name:"Anny", post_counter: 1))

  # subject.save
  it "Name must not be blank" do
    subject.name = nil
    expect(subject).to_not be_valid
end

  it "Title must not be blank" do
    subject.title = nil
    expect(subject).to_not be_valid
end


end
