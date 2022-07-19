require 'rails_helper'

RSpec.describe 'Post index', type: :system do
  user = User.first
  post = Post.find(1)
  comment = Comment.create(user:, post:, text: 'some text')

  it 'can see the current user name' do
    visit user_post_path(user, post)
    expect(page.body).to include(user.name)
  end

  it 'can see Number of Posts' do
    visit user_posts_path(user)
    expect(page.body).to include('Number of Posts: 4')
  end

  it 'can see post title/number' do
    visit user_posts_path(user)
    expect(page.body).to include("Post ##{post.id}")
  end

  it 'can see post text' do
    visit user_posts_path(user)
    expect(page.body).to include(post.text)
  end

  it 'can see the first comment' do
    visit user_posts_path(user)
    expect(page.body).to include(comment.text)
  end

  it 'can see the number of likes' do
    visit user_posts_path(user)
    expect(page.body).to include('Likes: 0')
  end

  it 'when I click on a post link, I am taken to the post show page' do
    visit user_posts_path(user)
    click_link("Post ##{post.id}")
    expect(current_path).to eq user_post_path(user, post)
  end
end
