require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'Post /authenticate' do
    user = FactoryBot.create(:user, name: 'Aaron', bio: 'Cool guy', photo: 'photo.com', email: 'aaron@coolguy.com',
                                    password: 'password')
    it 'authenticates the client' do
      post '/api/v1/users/:user_id/posts/:post_id/authenticate', params: { id: user.id }
      actual = AuthenticationTokenService.call(user.id)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
                                                'user_token' => actual.to_s
                                              })
    end

    it 'returns error when username is missing' do
      post '/api/v1/users/:user_id/posts/:post_id/authenticate', params: { encrypted_password: user.password.to_s }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
                                                'error' => 'param is missing or the value is empty: id'
                                              })
    end

    # it 'returns error when passwords are missing' do
    #   post "/api/v1/users/:user_id/posts/:post_id/authenticate", params: { id: "#{user.id}" }

    #   expect(response).to have_http_status(:unprocessable_entity)
    #   expect(JSON.parse(response.body)).to eq({
    #     'error' => 'param is missing or the value is empty: encrypted_password'
    #   })
    # end
  end
end
