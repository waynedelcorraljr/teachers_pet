class SessionsController < ApplicationController
    def new
        # @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Username/Password was invalid. Please try again."
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
        redirect_to user_path(@user)
    end

    private
    
    def auth
        request.env['omniauth.auth']
    end
end