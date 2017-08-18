class Response < ActiveRecord::Base
    belongs_to :request
    mount_uploader :companyURL, ImageUploader
end
