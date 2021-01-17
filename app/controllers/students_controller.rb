class StudentsController < ApplicationController
    def new
    end
    
    def create
    end
    
    def show
        @student = Student.find(params[:id])
    end

    def destroy
    end

    def edit 
    end

    def update
    end
end