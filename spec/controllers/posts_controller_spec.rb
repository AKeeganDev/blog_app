require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'test', bio: 'test', photo: 'test.com')
  testUser = User.find(user.id)
  post = Post.create(user: testUser, title: 'Cool title', text: 'Sweet text')

  describe 'GET /posts' do
    it 'response for index action status is correct' do
      get user_post_path(testUser.id, 1)
      expect(response).to have_http_status(200)
    end
  end

  it 'renders the index template' do
    get user_posts_path(testUser.id)
    expect(response).to render_template('index')
  end

  it 'renders the index template' do
    get user_post_path(testUser.id, 1)
    expect(response).to render_template(:show)
  end

  it 'placeholder text test' do
    get user_posts_path(testUser.id)
    expect(response.body).to include('Number of Posts')
  end
end
