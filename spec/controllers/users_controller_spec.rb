require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'response for index action status is correct' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  it 'renders the index template' do
    get users_path
    expect(response).to render_template('index')
  end

  it 'renders user/show action' do
    get user_path(1)
    expect(response).to render_template(:show)
  end

  it 'placeholder text test' do
    get users_path
    expect(response.body).to include('user/index')
  end
end
