class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }, presence: true
    validates :password, presence: true, uniqueness: {case_sensitive: true}, length: { minimum: 6 }
    validates :zipcode, presence: true

    has_many :events
    has_many :daily_posts
    

end
