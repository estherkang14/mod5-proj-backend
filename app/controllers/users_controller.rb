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
                :events => {
                    :except => [:created_at, :updated_at]
                },
                :daily_posts => {
                    :include => [:mood]
                }
            },
            :except => [:created_at, :updated_at]
        )
    end
    
    def create 
        user = User.new(user_params)

        if user.valid?
            user.save
            render json: {user: user, token: encode_token({user_id: user.id})}
        else 
            render json: {error: "Failure to create the user"}
        end 
    end 

    def destroy
        user = User.find(params[:id])
        user.destroy 

        render json: user
    end 

    # create update method to update account
    # def update
    #     user = User.find(params[:id])
        
        #   render json: user
    # end 

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :location, :zipcode)
    end 

    
end
