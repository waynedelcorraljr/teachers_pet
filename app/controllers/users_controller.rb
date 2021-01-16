class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        # raise params.inspect
        user = User.create(user_params)
        session[:user_id] = user.id
        redirect_to user_path(user)
    end
    
    def show
        @user = User.find(params[:id])
        # raise params.inspect
    end

    def destroy
        
    end

    def edit 
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end