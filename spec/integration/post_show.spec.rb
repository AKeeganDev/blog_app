require 'rails_helper'

RSpec.describe 'Post show', type: :system do
  user = User.first
  post = Post.first
  comment = Comment.first

  it 'can see the post title/number' do
    visit user_post_path(user, post)
    expect(page.body).to include("Post ##{post.id}")
  end

  it 'can see the post user name' do
    visit user_post_path(user, post)
    expect(page.body).to include(post.user.name)
  end

  it 'can see how many comments the post has' do
    visit user_post_path(user, post)
    expect(page.body).to include("Comments: #{post.comments.count}")
  end

  it 'can see how many likes the post has' do
    visit user_post_path(user, post)
    expect(page.body).to include("Likes: #{post.likes.count}")
  end

  it 'can see the comments user name' do
    visit user_post_path(user, post)
    expect(page.body).to include(comment.user.name)
  end

  it 'can see the post text' do
    visit user_post_path(user, post)
    expect(page.body).to include(post.text)
  end

  it 'can see the comment each commenter has made' do
    visit user_post_path(user, post)
    expect(page.body).to include(comment.text)
  end
end
