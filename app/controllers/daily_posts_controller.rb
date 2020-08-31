class DailyPostsController < ApplicationController
    skip_before_action :logged_in?

    def create
        daily_post = DailyPost.new(daily_post_params)
        
        if daily_post.valid?
            daily_post.save
            
            render json: daily_post.to_json(
                :except => [:created_at, :updated_at],
                :include => {
                    :user => {
                        :only => [:name, :username, :location],
                        :except => [:created_at, :updated_at]
                    },
                    :mood => {
                        :except => [:created_at, :updated_at]
                    }
                }
            )
        else
            render json: {error: "ERROR WITH DAILY POST"}
        end  
    end 

    def index 
        daily_posts = DailyPost.all 
        render json: daily_posts.to_json(
            :except => [:created_at, :updated_at, :blurb_id]
        )
    end 

    def show
        daily_post = DailyPost.find(params[:id])

        render json: daily_post.to_json(
            :except => [:created_at, :updated_at, :blurb_id]
        )
    end

    private

    def daily_post_params
        params.require(:daily_post).permit(:date, :mood_id, :user_id, :struggle, :thankful, :summary)
    end 
end
