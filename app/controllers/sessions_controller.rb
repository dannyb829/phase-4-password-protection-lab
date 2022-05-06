class SessionsController < ApplicationController
    def create
    user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { 
                id: user.id, username: user.username
              }, status: :created
        else
            render json: {error: "Incorrect username or password"}, status: 401
        end  
    end   
    
    def destroy 
        session.delete :user_id
        head :no_content
    end

end
