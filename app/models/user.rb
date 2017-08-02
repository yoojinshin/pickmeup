class User < ActiveRecord::Base
    has_secure_password
    before_save {self.email = email.downcase}
    
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :userName, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
