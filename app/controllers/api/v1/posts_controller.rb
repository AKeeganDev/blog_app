module Api
  module V1
    class PostsController < ApplicationController
      before_action :require_login

      def index
        # posts = Post.where(user: params[:user_id]).order('created_at DESC')
        posts = Post.includes([:user]).order('created_at DESC')

        p params[:id]
        render json: PostRepresenter.new(posts).as_json
      end
    end
  end
end
# class Api::PostsController < ApplicationController

#   def index
#     posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
#     render json: { posts: }, status: :ok
#   end
# end
