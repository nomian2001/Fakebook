module FeedsHelper
    def get_total_likes(posts)
        total_like = 0
        posts.each do |post|
            total_like += post.likes.count
        end
        return total_like
    end
end
