require 'rails_helper'

RSpec.describe 'Comments API', type: :request do
  before do
    @user = FactoryBot.create(:user, name: 'Karl', bio: 'Cool guy', photo: 'photo.com', email: 'aaron@coolguy.com',
                                     password: 'password')
    @post = FactoryBot.create(:post, user_id: @user.id, title: 'Sweet title', text: 'sweet text, Karl')
  end

  it 'Checks to ensure a comment is added to the database' do
    expect do
      post api_v1_user_post_comments_path(@user, @post),
           params: { comment: { user_id: @user.id, post_id: @post.id, text: 'sweet text' } }
    end.to change { Comment.count }.from(0).to(1)
    p api_v1_user_post_comments_path(@user, @post)
    expect(response).to have_http_status(:created)
  end
end
