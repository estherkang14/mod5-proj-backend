class Event < ApplicationRecord
    has_many :user_events
    has_many :users, through: :user_events 
    
    def get_national_holidays
        national_holidays = Event.all.select { |event| event.event_type == "National Holiday"}
        return national_holidays 
    end 
end
