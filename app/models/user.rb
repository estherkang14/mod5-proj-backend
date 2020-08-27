class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false } 
    has_many :user_events
    has_many :events, through: :user_events
    has_many :daily_posts
    

end
