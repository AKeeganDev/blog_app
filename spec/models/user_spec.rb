require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'augusto', photo: 'www.photo.com', bio: 'I am a software developer') }

  before { subject.save }

  it 'name should be present' do
    # subject.posts_counter = 0
    expect(subject).to be_valid
  end
end