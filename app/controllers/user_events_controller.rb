class UserEventsController < ApplicationController
    skip_before_action :logged_in?

    def index 
        user_events = UserEvent.all 
        render json: user_events
    end 

    def show
        user_event = UserEvent.find(params[:id])

        render json: user_event.to_json(
            :except => [:created_at, :update_at],
            :include => {
                :user,
                :event 
            }
        )
    end 
end
