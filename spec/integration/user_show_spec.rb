require 'rails_helper'

RSpec.describe 'User Show', type: :system do
  user = User.first
  (1..3).each { |a| Post.create(user:, title: "some title #{a + 1}", text: "some text #{a + 1}") }

  it 'can see the users profile picture' do
    visit user_path(user.id)
    expect(page.body).to include('img_placeholder')
  end

  it 'can see the current user name' do
    visit user_path(user.id)
    expect(page.body).to include(user.name)
  end

  it 'can see Number of Posts' do
    visit user_path(user.id)
    expect(page.body).to include('Number of Posts')
  end

  it 'can see Bio' do
    visit user_path(user.id)
    expect(page.body).to include(user.bio)
  end

  it 'can see 3 recent posts' do
    posts = user.recent_posts.map(&:text)
    visit user_path(user.id)
    expect(page.body).to include(*posts)
  end

  it 'Checks if the see all posts button appears' do
    visit user_path(user.id)
    expect(page.has_button?('See all posts')).to eq true
  end

  it 'Checks navigation from clicking see all posts button' do
    visit user_path(user.id)
    click_button('See all posts')
    expect(current_path).to eq user_posts_path(user.id)
  end
end
