class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    create_like unless liked?
  end

  private

  def liked?
    Like.where(user_id: @user.id, post_id: @post.id).exists?
  end

  def create_like
    @like = Like.new
    @like.user_id = @user.id
    @like.post_id = params[:post_id]
    redirect_to user_post_path(@user, @post) if @like.save
  end
end
