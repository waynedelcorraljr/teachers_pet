class CoursesController < ApplicationController
    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
            @courses = @user.courses
        else
            flash[:alert] = "Must be logged in to perform this action."
            redirect_to signin_path
        end
    end
    
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
        end
    end
    
    def show
        @course = Course.find(params[:id])
        # raise params.inspect
    end

    def destroy
        course = Course.find(params[:id])
        course.destroy
        redirect_to user_path(session[:user_id])
    end

    def edit 
        @course = Course.find(params[:id])
    end
    
    def update
        @course = Course.find(params[:id])
        if session[:user_id] == @course.user.id
            @course.update(course_params)
            redirect_to user_courses_path(@course.user)
        else
            flash[:alert] = "Course must belong to you to edit."
            redirect_to courses_path
        end
    end

    private

    def course_params
        params.require(:course).permit(:name, :description, :user_id, :student_id)
    end
end