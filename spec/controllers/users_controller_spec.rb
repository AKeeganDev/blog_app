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

  it 'Username appears on on the users page' do
    name = User.first.name
    get users_path
    expect(response.body).to include(name)
  end

  it 'image placeholder has loaded' do
    get users_path
    expect(response.body).to include('img_placeholder')
  end

  it 'Number of posts appears' do
    get users_path
    expect(response.body).to include('Number of Posts')
  end

  it 'Checks navigation from clicking link to user profile' do
    user = User.first
    get user_path(user.id)
    expect(request.path).to eq '/users/1'
  end
end
