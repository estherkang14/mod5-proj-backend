class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false } 
    
    has_many :events
    has_many :daily_posts
    

end
