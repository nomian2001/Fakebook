class CommentsController < ApplicationController
    
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = @post.id
        if @comment.save
            redirect_back(fallback_location: root_path)
        end
    end
  
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_back(fallback_location: root_path)
    end
  
    private 
    def comment_params
        params.require(:comment).permit(:content,:post_id,:user_id)
    end
end
