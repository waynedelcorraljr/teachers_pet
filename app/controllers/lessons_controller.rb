class LessonsController < ApplicationController
    def index
        if params[:course_id]
            @course = Course.find_by(id: params[:course_id])
            @lessons = @course.lessons
        else
            redirect_to courses_path
        end
    end

    def new
        if params[:course_id] && Course.find_by(id: params[:course_id]).user_id == session[:user_id]
            @lesson = Lesson.new(course_id: params[:course_id])
        else
            redirect_to root_path
        end
    end
    
    def create
        # raise params.inspect
        @lesson = Lesson.new(lesson_params)
        if @lesson.save
            redirect_to course_lesson_path(@lesson.course, @lesson)
        else
            flash.now[:alert]= "Lesson must have title."
            render :new
        end
    end
    
    def show
        @lesson = Lesson.find(params[:id])
    end

    def destroy
        course = Course.find_by(id: params[:course_id])
        lesson = Lesson.find_by(id: params[:id])
        lesson.destroy
        redirect_to course_lessons_path(course)
    end

    def edit 
        @lesson = Lesson.find_by(id: params[:id])
    end

    def update
        @lesson = Lesson.find_by(id: params[:id])
        if session[:user_id] == @lesson.course.user.id
            @lesson.update(lesson_params)
            redirect_to course_lesson_path(@lesson.course, @lesson)
        else
            flash[:alert] = "Lesson must belong to you to edit."
            redirect_to course_lessons_path(@lesson.course)
        end
    end

    private

    def lesson_params
        params.require(:lesson).permit(:title, :plan, :course_id)
    end
end