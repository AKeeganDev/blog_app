class CommentsController < ApplicationController
  def create
    p 'create started'
    p params
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.user = @user
    @comment.post = @post
    p "got to end of variables user #{@user.name} post #{@post.text} comment on #{@comment.post.id}"

    if @comment.save
      flash[:success] = 'New Post saved successfully!'
      p @comment
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Post failed..'
      render :new
    end
    p params
  end

  def new
    @comment = Comment.new
    @user = current_user
    @post = Post.find(params[:post_id])
    render :new
    p params
  end
end
