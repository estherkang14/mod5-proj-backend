class EventsController < ApplicationController
    skip_before_action :logged_in?, only: [:index, :show]

    def index
        events = Event.all 

        render json: events.to_json(
            :except => [:created_at, :updated_at]
        )
    end 
    
end
