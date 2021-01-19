class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find(params[:username])
        if user.authenticate(params[:password]) 
            session[:user_id] = user.id
        
            redirect_to user_path(user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to root_path
    end

    private
    
    def auth
        request.env['omniauth.auth']
    end
end