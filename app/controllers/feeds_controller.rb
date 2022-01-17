class FeedsController < ApplicationController
    before_action :authenticate_user!

    def index
        ids = current_user.friends.pluck(:id) << current_user.id
        @posts = Post.where(user_id: ids).order("created_at DESC")
        @post = current_user.posts.build
        @users = User.all_except(current_user)
        @comment = @post.comments.build
        @comments = @post.comments.all.order("created_at DESC")
    end

    def current
        @posts = current_user.posts.all.order("created_at DESC")
        @post = current_user.posts.build
        @users = User.all_except(current_user)
        @comment = @post.comments.build
        @comments = @post.comments.all.order("created_at DESC")
    end

end
