class Review < ActiveRecord::Base
    has_many :comments
    is_impressionable
    mount_uploader :imageURL, ImageUploader
    has_many :user
    has_many :posts


end
