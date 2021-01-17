class LessonsController < ApplicationController
    def new
    end
    
    def create
    end
    
    def show
        @lesson = Lesson.find(params[:id])
    end

    def destroy
    end

    def edit 
    end

    def update
    end
end