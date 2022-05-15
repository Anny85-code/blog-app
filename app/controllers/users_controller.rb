class UsersController < ApplicationController
  def index
    # @users = User.all
    #  render :json => User.all

     render :nothing => true, :status => 404

     respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @users }
        format.json { render :json => @users }
      end
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find(params[:id])
  end
end
