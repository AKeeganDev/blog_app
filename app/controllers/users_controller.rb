class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user
  end

  def show
    @user = current_user
    @recent_posts = @user.recent_posts
    p current_user
  end
end
