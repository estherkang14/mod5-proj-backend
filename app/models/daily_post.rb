class DailyPost < ApplicationRecord
    belongs_to :user 
    belongs_to :mood  

    validates :mood_id, presence: true 
    validates :date, presence: true
    validates :thankful, presence: true 
    validates :struggle, presence: true 
    validates :summary, presence: true, length: { maximum: 120 }
    validates :water, length: { minimum: 0 }

end
