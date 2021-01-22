class LessonsController < ApplicationController
    def index
        if params[:course_id]
            redirect_to user_course_path(current_user, Course.find_by(id: params[:course_id]))
        else
            redirect_to courses_path
        end
    end

    def new
        if params[:course_id]
            @lesson = Lesson.new(course_id: params[:course_id])
        else
            redirect_to courses_path
        end
    end
    
    def create
        # raise params.inspect
        @lesson = Lesson.new(lesson_params)
        if @lesson.save
            redirect_to course_lesson_path(@lesson.course, @lesson)
        else
            flash[:alert]= "Lesson must have title."
            render :new
        end
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

    private

    def lesson_params
        params.require(:lesson).permit(:title, :plan, :course_id)
    end
end