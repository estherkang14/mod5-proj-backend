class DailyPostsController < ApplicationController
    skip_before_action :logged_in?

    def create
        daily_post = DailyPost.new(daily_post_params)

        # byebug
        
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
            render json: {errors: daily_post.errors.full_messages}
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

    def update 
        daily_post = DailyPost.find(params[:id])

        if daily_post.update(daily_post_params)
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
            render json: {errors: daily_post.errors.full_messages}
        end  
    end 

    private

    def daily_post_params
        params.permit(:date, :mood_id, :user_id, :struggle, :thankful, :summary, :water)
    end 
end
