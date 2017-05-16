class InstructorsController < ApplicationController
  before_action :instructor_id

  def instructor_id
    @instructor = Instructor.find(params[:id])
  end

  def index
    @lessons = @instructor.lessons.all
  end

  def show
    @lessons = @instructor.lessons.all
  end

  def new
    @lesson = @instructor.lesson.new
  end

  def create
    @lesson = @instructor.lesson.new(user_params)
    if @lesson.save
      flash.now[:notice] = "Lekcja została zapisana"
      redirect_to lessons_path
    else
      flash[:error] = "Nie udało się zapisać lekcji"
      render :new
    end
  end

  def edit
    @lesson = @instructor.Lesson.find(params[:id])
  end

  def update
    @lesson = @instructor.Lesson.find(params[:id])
    if @lesson.update(user_params)
      flash.now[:notice] = "Zmodyfikowano dane lekcji"
      redirect_to lessons_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :edit
    end
  end

  def destroy
    lesson = @instructor.Lesson.find(params[:id])
    lesson.destroy
    flash[:notice] = "Usunięto lekcję #{lesson.lesson_time}"
    redirect_to lessons_path
  end

  private

  def user_params
    params.require(:lessons).permit(:instructors_id, :student_id, :lesson_time, :confirmed)
  end

end
