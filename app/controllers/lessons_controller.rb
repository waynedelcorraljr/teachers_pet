class LessonsController < ApplicationController
    def new
        @lesson = Lesson.new
    end
    
    def create
    end
    
    def show
        @lesson = Lesson.find(params[:id])
        # raise params.inspect
    end

    def destroy
    end

    def edit 
    end

    def update
    end
end