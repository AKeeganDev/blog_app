class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user

    respond_to do |format|
      format.html
      format.xml { render xml: @users }
      format.json { render json: @users }
    end
  end

  def show
    @user = current_user
    @recent_posts = @user.recent_posts
    p current_user

    respond_to do |format|
      format.html
      format.xml { render xml: @user.posts }
      format.json { render json: @user }
    end
  end
end
