class StudentsController < ApplicationController
    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
            @students = @user.students
        else
            redirect_to signin_path
        end
    end
    
    def new
    end
    
    def create
    end
    
    def show
        @student = Student.find(params[:id])
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        redirect_to students_path
    end

    def edit 
    end

    def update
    end
end