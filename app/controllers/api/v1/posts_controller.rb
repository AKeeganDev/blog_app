module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.where(user: params[:user_id]).order('created_at DESC')
        
        p params[:id]
        render json: PostRepresenter.new(posts).as_json
        # render json: {code: 200, success: true, message: 'Successfully loaded all posts', data: { posts: @posts } }, status: :ok
      end
    end
  end
end