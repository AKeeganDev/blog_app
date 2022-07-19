require 'rails_helper'

RSpec.describe 'User index', type: :system do
  users = User.all.map(&:name)
  it 'can see the users profile picture' do
    visit users_path
    expect(page.body).to include('img_placeholder')
  end

  it 'can see all users from the database displayed on the home page' do
    visit users_path
    expect(page.body).to include(*users)
  end

  it 'can see Number of Posts' do
    visit users_path
    expect(page.body).to include('Number of Posts')
  end

  it 'Checks navigation from clicking link to user profile' do
    user = User.first
    visit '/users'
    click_on(user.name)
    expect(current_path).to eq '/users/1'
  end
end
