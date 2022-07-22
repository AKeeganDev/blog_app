module Api
  module V1
    class CommentsController < ApplicationController
      include ActionController::HttpAuthentication::Token
      def index
        @comments = Comment.where(post_id: params[:post_id]).where(user_id: params[:user_id]).order(:created_at)
        # @comments = Comment.all
        # 2 16
        render json: { code: 200, success: true, message: 'Successfully loaded comments', data: { comments: @comments } }
      end

      def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = params[:user_id]
        @comment.post_id = params[:post_id]

        if @comment.save
          render json: { success: true, message: 'Successfully created comment', data: { comment: @comment } },
          status: :created

        else
          render json: { success: false, errors: @comment.errors }, status: :unprocessable_entity
        end
      end

      

      private

      def comment_params
        params.require(:comment).permit(:text)
      end

      def no_record(post)
        render json: { success: false, message: "This post: #{post} does not exist" }, status: :not_found
      end

      def authenticate_user
        token, _options = token_and_options(request)
        raise token.inspect
      end
    end
  end
end