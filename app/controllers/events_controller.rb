class EventsController < ApplicationController
    skip_before_action :logged_in?

    def create
        event = Event.new(event_params)

        # byebug 

        if event.valid?
            event.save
            
            render json: event.to_json(
                :except => [:created_at, :updated_at],
                :include => {
                    :user => {
                        :only => [:username, :id]
                    }
                }
            )
        else
            render json: {error: "ERROR WITH EVENT POST"}
        end  
    end 

    def index
        events = Event.all 

        render json: events.to_json(
            :except => [:created_at, :updated_at]
        )
    end 

    def show 
        event = Event.find(params[:id])

        render json: event.to_json(
            :except => [:created_at, :update_at]
        )
    end 

    def destroy
        event = Event.find(params[:id])
        event.destroy 

        render json: event
    end 

    private 

    def event_params
        params.permit(:user_id, :title, :event_type, :start_date, :end_date, :notes)
    end 
    
end
