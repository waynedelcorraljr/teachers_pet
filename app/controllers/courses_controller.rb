class CoursesController < ApplicationController
    def new
        # raise params.inspect
        if session[:user_id]
            @course = Course.new(user_id: session[:user_id]) 
        else
            redirect_to signin_path
        end
    end
    
    def create 
        @course = Course.create(course_params)
        # raise params.inspect

        if @course.valid?
            redirect_to user_path(@course.user)
        else
            render :new
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