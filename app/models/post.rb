class Post < ActiveRecord::Base
    # Post.search(검색할 쿼리)
def self.search(query)
    self.where("title || content LIKE ?","%#{query}%")
end

end
