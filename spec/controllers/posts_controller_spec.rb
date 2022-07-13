require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'response for index action status is correct' do
      get user_post_path(1, 2)
      expect(response).to have_http_status(404)
    end
  end

  # it 'renders the index template' do
  #   get users_path
  #   expect
  # end
end
