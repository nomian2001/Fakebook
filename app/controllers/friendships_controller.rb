class FriendshipsController < ApplicationController
    def create
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if @friendship.save
          flash[:notice] = "Added friend."
          redirect_back(fallback_location: root_path)
        else
          flash[:error] = "Unable to add friend."
          redirect_back(fallback_location: root_path)
        end
    end
      
    def destroy
      @friendship = current_user.friendships.find(params[:id])
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_back(fallback_location: root_path)
    end
end
