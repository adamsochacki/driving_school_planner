class InstructorlessonsController < ApplicationController

  def index
    @lessons = current_user.instructorlessons
    #@lessons = lessons.where(instructor_id: current_user.id)
  end

  def show
    @lessons = current_user.instructorlessons
  end

  def new
    @lesson = current_user.instructorlessons.new
  end

  def create
    @lesson = current_user.instructorlessons.new(user_params)
    @lesson.instructor_id = current_user.id
    if @lesson.save!
      flash.now[:notice] = "Lekcja została zapisana"
      redirect_to instructorlessons_path
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
      redirect_to instructorlessons_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :edit
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    flash[:notice] = "Usunięto lekcję"
    redirect_to instructorlessons_path
  end


  private

  def user_params
    params.require(:lesson).permit(:student_id, :lesson_time, :confirmed)
  end

end