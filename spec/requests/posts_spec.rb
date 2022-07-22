require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  user = FactoryBot.create(:user, name: 'Aaron', bio: 'Cool guy', photo: 'photo.com', email: 'aaron@coolguy.com',
                                  password: 'password')

  it 'return all posts for a given user' do
    get api_v1_user_posts_path(user)
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)['data']['posts'].size).to eq(1)
  end
end
