class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def index
        redirect_to new_user_path
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Username/Password was invalid. Please try again."
            render :new
            # raise @user.errors.inspect
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
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