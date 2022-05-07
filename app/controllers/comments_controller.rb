class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(user_id: @post.author_id, id: @post.id) }
        flash[:notice] = "You have successfully created a comment."
      else
        format.html { render :new, alert: 'An error has occurred while creating the comment!', class: 'alert-danger' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
