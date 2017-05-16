class LessonsController < ApplicationController

  def index
    @lessons = current_user.lessons.all
  end

  def show
    @lessons = current_user.lessons.all
  end

  def new
    @lesson = current_user.lessons.new
  end

  def create
    @lesson = current_user.lessons.new(user_params)
    if @lesson.save!
      flash.now[:notice] = "Lekcja została zapisana"
      redirect_to lessons_path
    else
      flash[:error] = "Nie udało się zapisać lekcji"
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(user_params)
      flash.now[:notice] = "Zmodyfikowano"
      redirect_to lessons_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :edit
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    flash[:notice] = "Usunięto lekcję"
    redirect_to lessons_path
  end

  private

  def user_params
    params.require(:lesson).permit(:instructor_id, :student_id, :lesson_time, :confirmed)
  end

end