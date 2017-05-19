class InstructorlessonsController < ApplicationController

  def index
    @confirmed_lessons = current_user.instructorlessons.where(confirmed: true)
    @unconfirmed_lessons = current_user.instructorlessons.where("confirmed = ? OR confirmed IS NULL", false)
  end

  def new
    @lesson = current_user.instructorlessons.new
  end

  def create
    @lesson = current_user.instructorlessons.new(user_params)
    @lesson.instructor_id = current_user.id
    if @lesson.save
      flash.now[:notice] = "Lesson has been created"
      redirect_to instructorlessons_path
    else
      flash[:error] = "Lesson time is reserved."
      render :new
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(:confirmed => "true")
      redirect_to instructorlessons_path
    else
      flash[:error] = "Your lesson cannot be confirmed"
    end
  end    

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    flash[:notice] = "Lesson has been deleted"
    redirect_to instructorlessons_path
  end


  private

  def user_params
    params.require(:lesson).permit(:student_id, :lesson_id, :lesson_time, :confirmed)
  end

end