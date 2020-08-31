class MoodsController < ApplicationController
    skip_before_action :logged_in?

    def index
        moods = Mood.all 

        render json: moods.to_json(
            :except => [:created_at, :updated_at]
        )
    end 

    def show 
        mood = Mood.find(params[:id])

        render json: mood.to_json(
            :except => [:created_at, :update_at]
        )
    end 
end
