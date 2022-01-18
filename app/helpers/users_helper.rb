module UsersHelper
    def is_friend?(user)
        user.friends.each do |friend|
            if friend.id == current_user.id
                return true
            end
        end
        return false
    end
end
