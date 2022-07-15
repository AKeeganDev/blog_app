class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @recent_posts = @user.recent_posts
  end
end
