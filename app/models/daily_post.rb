class DailyPost < ApplicationRecord
    belongs_to :user 
    has_one :mood 
    has_one :blurb 
end
