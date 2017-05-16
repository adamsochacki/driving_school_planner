class StudentsController < ApplicationController
  before_action :student_id

  def student_id
    @student = Student.find(params[:id])
  end

  def index
    @lessons = @student.lessons.all
  end

  def show
    @lessons = @student.lessons.all
  end

  def new
    @lesson = @student.Lesson.new
  end

  def create
    @lesson = @student.Lesson.new(user_params)
    if @lesson.save
      flash.now[:notice] = "Lekcja została zapisana"
      redirect_to lessons_path
    else
      flash[:error] = "Nie udało się zapisać lekcji"
      render :new
    end
  end

  def destroy
    lesson = @student.Lesson.find(params[:id])
    lesson.destroy
    flash[:notice] = "Usunięto lekcję #{lesson.datetime}"
    redirect_to lessons_path
  end

  private

  def user_params
    params.require(:lessons).permit(:datetime)
  end

end
