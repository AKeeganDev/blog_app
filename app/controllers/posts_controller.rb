class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(user: params[:user_id])
    @all_posts = Post.where(user: params[:user_id])
    @all_comments = Comment.where(user_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.user = current_user
    p params

    if @post.save
      flash[:success] = 'New Post saved successfully!'
      p @post
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Post failed..'
      render :new
    end
  end
end
