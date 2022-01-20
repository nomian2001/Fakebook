module LikesHelper
    def count_like (post)
        return post.likes.count
    end
end
