require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'test', bio: 'test', photo: 'test.com')
  test_user = User.find(user.id)
  Post.create(user: test_user, title: 'Cool title', text: 'Sweet text')

  describe 'GET /posts' do
    it 'response for index action status is correct' do
      get user_post_path(test_user.id, 1)
      expect(response).to have_http_status(200)
    end
  end

  it 'renders the index template' do
    get user_posts_path(test_user.id)
    expect(response).to render_template('index')
  end

  it 'renders the index template' do
    get user_post_path(test_user.id, 1)
    expect(response).to render_template(:show)
  end

  it 'placeholder text test' do
    get user_posts_path(test_user.id)
    expect(response.body).to include('Number of Posts')
  end
end
