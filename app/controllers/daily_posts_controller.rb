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
                    :blurb => {
                        :except => [:created_at, :updated_at]
                    }
                }
            )
end
