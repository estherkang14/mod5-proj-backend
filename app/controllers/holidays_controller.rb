class HolidaysController < ApplicationController
    
    skip_before_action :logged_in?, only: [:index, :show]

    def index
        holidays = Holiday.all 

        render json: holidays.to_json(
            :except => [:created_at, :updated_at]
        )
    end 

    def show 
        holiday = Holiday.find(params[:id])

        render json: holiday.to_json(
            :except => [:created_at, :update_at]
        )
    end 


end
