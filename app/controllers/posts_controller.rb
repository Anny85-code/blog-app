class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
