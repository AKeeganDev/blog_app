require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Jorge', photo: 'www.sweetimage.com', bio: 'Super smart')
  post = Post.create(user:, title: 'Title', text: 'sweet text!')

  subject { Like.new(user:, post:) }

  before { subject.save }

  it 'should increment post likes_counter' do
    # subject { Like.new(user: user, post: post) }
    counter = post.likes_counter
    subject.save
    expect(post.likes_counter).to eq(counter + 1)
  end
end
