class CoursesController < ApplicationController
    def new
    end
    
    def create
    end
    
    def show
        @course = Course.find(params[:id])
        # raise params.inspect
    end

    def destroy
    end

    def edit 
    end

    def update
    end
end