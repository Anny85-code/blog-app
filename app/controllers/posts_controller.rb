class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments, :likes).find(params[:user_id])
    @posts = Post.all
    # @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = Post.includes(:author, :comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.includes(:comments).new(post_params)
    @post.author = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_path(id: @post.author_id) }
        flash[:notice] = 'You have successfully created a post.'
      else
        format.html { render :new, alert: 'An error has occurred while creating the post' }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
