class Company < ActiveRecord::Base
    mount_uploader :imageURL, ImageUploader
    mount_uploader :menuURL, ImageUploader
    mount_uploader :storeURL, ImageUploader
end
