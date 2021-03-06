class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.includes(:author, :comments, :likes).find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(user_id: @post.author_id, id: @post.id) }
        flash[:notice] = 'Thanks for your comment.'
      else
        format.html { render :new, alert: 'An error has occurred while creating the comment!', class: 'alert-danger' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @post.decrement!(:comments_counter)
    @comment.destroy!
    redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Success!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
