require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Henry', photo: 'https://www.coolpicturehostingsite.com/', bio: 'Pretty cool guy!')

  subject { Post.new(user:, title: 'Cool title', text: 'Sweet text') }

  before { subject.save }

  it 'Post should be valid' do
    expect(subject).to be_valid
  end

  it 'title should be under 250 characters in length' do
    expect(subject.title.size).to be < 250
  end

  it ':recent_comments should return 5 posts even if there are more posts to gather' do
    Comment.create(text: 'text for post 1', user:, post: subject)
    Comment.create(text: 'text for post 2', user:, post: subject)
    Comment.create(text: 'text for post 3', user:, post: subject)
    Comment.create(text: 'text for post 4', user:, post: subject)
    Comment.create(text: 'text for post 5', user:, post: subject)
    Comment.create(text: 'text for post 6', user:, post: subject)
    expect(subject.recent_comments.size).to eq(5)
  end

  it 'expect post counter to increment' do
    counter = user.posts_counter
    subject.save
    expect(user.posts_counter).to eq(counter + 1)
  end
end
