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

    #info=#<OmniAuth::AuthHash::InfoHash
    #  email="wdelcorjr@gmail.com" 
    #  email_verified=true 
    #  first_name="Wayne" 
    #  image="https://lh3.googleusercontent.com/a-/AOh14Gjto8lkYc-KglhpyiQQ_u9CrXTKA10_fYo12VwKC0Q=s96-c" 
    #  last_name="del Corral" 
    #  name="Wayne del Corral" 
    #  unverified_email="wdelcorjr@gmail.com"> 
    #  provider="google_oauth2" 
    #  uid="106581322659973844042">
    
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