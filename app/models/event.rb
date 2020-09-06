class Event < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :event_type, presence: true 
    # validates :start_date, presence: true 

    
    def get_national_holidays
        national_holidays = Event.all.select { |event| event.event_type == "National Holiday"}
        return national_holidays 
    end 
end
