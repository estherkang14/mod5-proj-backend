class DailyPost < ApplicationRecord
    belongs_to :user 
    belongs_to :mood  
    belongs_to :blurb 
end
