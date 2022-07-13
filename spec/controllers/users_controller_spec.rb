require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'response for index action status is correct' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  # it 'renders the index template' do
  #   get users_path
  #   expect
  # end
end
