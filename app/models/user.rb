class User < ApplicationRecord
    has_many :lists
    has_many :tasks
    has_secure_password

    VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :name, presence: true, length: { maximum: 50 }
    validates :password, length: { minimum: 6 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_FORMAT }, uniqueness: {case_sensitive: false}
    before_save { self.email = email.downcase }

end
