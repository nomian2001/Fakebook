class CommentsController < ApplicationController
    
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = @post.id
        if @comment.save
            respond_to do |format|
              format.html { redirect_back(fallback_location: root_path) }
              format.js {flash.now[:notice] = "Added comment"}
            end
        else
            flash[:alert] = "Check the comment form, something went wrong."
            render root_path
        end
    end
  
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        respond_to do |format|
            format.html { redirect_back(fallback_location: root_path) }
            format.js {flash.now[:notice] = "Deleted comment"}
        end
    end
  
    private 
    def comment_params
        params.require(:comment).permit( :content,:post_id,:user_id)
    end
end
