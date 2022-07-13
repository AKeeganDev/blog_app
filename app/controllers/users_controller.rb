class UsersController < ApplicationController
  def index
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  def show; end
end
