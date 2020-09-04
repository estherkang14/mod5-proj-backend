class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }, presence: true
    validates :password, presence: true, length: { minimum: 6 }

    has_many :events
    has_many :daily_posts
    

end
