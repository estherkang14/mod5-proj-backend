class ApplicationController < ActionController::API
    before_action :logged_in?

    def encode_token(payload)
        JWT.encode(payload, 'DC060120', 'HS256')
    end 

    def logged_in?
        headers = request.headers["Authorization"]

        user_id = JWT.decode(headers, 'DC060120', 'HS256')[0]["user_id"]
        user = User.find_by(user_id)

        render json: {error: "Please log in"} unless user
    end 
end
