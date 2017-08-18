class Request < ActiveRecord::Base
    has_many :responses
    mount_uploader :frontURL, ImageUploader
    mount_uploader :backURL, ImageUploader
    mount_uploader :damageURL, ImageUploader
    mount_uploader :styleURL, ImageUploader
end
