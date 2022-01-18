class UsersController < ApplicationController
  before_action :find_user
  def index
    @users = User.all
    @posts = @user.posts.all.order("created_at DESC")
    @post = current_user.posts.build
    @strangers = User.all_except(@user)
    @comments = @post.comments.all.order("created_at DESC")
  end

  private
    def find_user
      @user = User.find(params[:id])
    end
end
