class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]
  
    def create
        if already_liked?
            flash[:notice] = "You can only like once"
        else
            @post.likes.create(user_id: current_user.id)
            respond_to do |format| 
                format.html { redirect_back(fallback_location: root_path) }
                format.js {flash.now[:notice] = "You Liked post"}
            end
        end
    end

    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else 
            @like.destroy
            respond_to do |format| 
                format.html {redirect_back(fallback_location: root_path)}
                format.js {flash.now[:notice] = "You unliked post"}
            end
        end
    end

  private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end

    def find_like
        @like = @post.likes.find(params[:id])
    end
end
