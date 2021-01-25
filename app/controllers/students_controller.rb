class StudentsController < ApplicationController
    def index
        if session[:user_id]
            @students = current_user.students.uniq.sort_by {|s| s.name}
        else
            flash[:alert] = "Must be signed in to view students."
            redirect_to signin_path
        end
    end
    
    def new
        if session[:user_id]
            @student = Student.new
        else
            flash[:alert] = "Must be logged in to create student."
            redirect_to signin_path
        end
    end
    
    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to user_path(current_user)
        else
            flash.now[:alert] = @student.errors.messages
            render :new
        end
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
        @student = Student.find_by(id: params[:id])
    end

    def update
        @student = Student.find_by(id: params[:id])
        if @student.users.include?(current_user)
            @student.update(student_params)
            redirect_to user_students_path(current_user)
        else
            flash[:alert] = "Must be one of your students to edit."
            redirect_to students_path
        end
    end

    private

    def student_params
        params.require(:student).permit(:name, :grade)
    end
end