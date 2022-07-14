require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'response for index action status is correct' do
      get user_post_path(1, 2)
      expect(response).to have_http_status(200)
    end
  end

  it 'renders the index template' do
    get user_posts_path(2)
    expect(response).to render_template('index')
  end

  it 'renders the index template' do
    get user_post_path(2, 1)
    expect(response).to render_template(:show)
  end

  it 'placeholder text test' do
    get user_posts_path(2)
    expect(response.body).to include('posts/index')
  end
end
