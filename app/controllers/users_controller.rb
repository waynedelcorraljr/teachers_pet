class UsersController < ApplicationController
    def new
        if session[:user_id]
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end

    def index
        if session[:user_id]
            redirect_to user_path(current_user)
        else
            redirect_to root_path
        end
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.now[:alert] = "Username/Password was invalid. Please try again."
            render :new
            # raise @user.errors.inspect
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
        if @user && @user.id == current_user.id
            @user
        else
            flash[:alert] = "You cannot view other user's classroom"
            redirect_to user_path(current_user)
        end   
        # raise params.inspect
    end

    def destroy
        redirect_to root_path 
    end

    def edit 
        redirect_to root_path
        # @user = User.find_by(id: params[:id]) 
    end

    def update
        redirect_to root_path
        # @user = User.find_by(id: params[:id])
        # if session[:user_id] == @user.id
        #     @user.update(user_params)
        #     redirect_to user_path(@user)
        # else
        #     flash[:alert] = "You can only edit your own information"
        #     redirect_to root_path
        # end 
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end