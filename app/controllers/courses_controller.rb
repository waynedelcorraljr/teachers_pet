class CoursesController < ApplicationController
    def new
        # raise params.inspect
        if session[:user_id]
            @course = Course.new(user_id: session[:user_id]) 
        else
            flash[:alert] = "Must be logged in to create courses."
            redirect_to signin_path
        end
    end
    
    def create 
        @course = Course.new(course_params)
        
        if @course.save
            redirect_to user_path(@course.user)
        else
            flash[:alert] = "Must complete all fields."
            render :new
            # raise @course.errors.inspect
        end
    end
    
    def show
        @course = Course.find(params[:id])
        # raise params.inspect
    end

    def destroy
        # raise params.inspect
        course = Course.find(params[:id])
        course.destroy
        redirect_to user_path(session[:user_id])
    end

    def edit 
    end

    def update
    end

    private

    def course_params
        params.require(:course).permit(:name, :description, :user_id, :student_id)
    end
end