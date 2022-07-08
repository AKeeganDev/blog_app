require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'augusto', photo: 'www.photo.com', bio: 'I am a software developer') }

  before { subject.save }

  it 'User should be valid without change' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be integer' do
    expect(subject.posts_counter).to be_a(Integer)
  end

  it ':recent posts should return 3 posts even if there are more posts to gather' do
    Post.create(user: subject, title: 'Cool title', text: 'text for post 1')
    Post.create(user: subject, title: 'Cool title x2', text: 'text for post 2')
    Post.create(user: subject, title: 'Cool title x3', text: 'text for post 3')
    Post.create(user: subject, title: 'Cool title x4', text: 'text for post 4')
    expect(subject.recent_posts.size).to eq(3)
  end
end
