class Event < ApplicationRecord
    belongs_to :user
    
    def get_national_holidays
        national_holidays = Event.all.select { |event| event.event_type == "National Holiday"}
        return national_holidays 
    end 
end
