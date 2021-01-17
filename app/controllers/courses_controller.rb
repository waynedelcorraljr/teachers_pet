class CoursesController < ApplicationController
    def new
        @course = Course.new
    end
    
    def create
        @course = Course.create(course_params)
        redirect_to user_path(@course.user)
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