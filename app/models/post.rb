class Post < ActiveRecord::Base
    belongs_to :user
    # Post.search(검색할 쿼리)
def self.search(query)
    self.where("title || content LIKE ?","%#{query}%")
end

end
