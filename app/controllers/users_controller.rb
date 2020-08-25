class UsersController < ApplicationController
    skip_before_action :logged_in?

    def index 
        users = User.all 
        render json:users 
    end 

    def show
        user = User.find(params[:id])

        render json: user.to_json(
            :include => {
                :user_events => {
                    :include => [:event]
                },
                daily_posts => {
                    :include => [:mood, :blurb]
                }
            }
        )
    end
    
    def create 
        user = User.new(user_params)

        if user.valid?
            user.save
            render json: {user: user, token: encode_token({user_id: user.id})}
        else 
            render json: {error: "Failer to create the user"}
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:name, :username:, :password, :location)
    end 

    
end
