class StudentlessonsController < ApplicationController

  def index
    @confirmed_lessons = current_user.studentlessons.where(confirmed: true)
    @unconfirmed_lessons = current_user.studentlessons.where("confirmed = ? OR confirmed IS NULL", false)
  end

  def new
    @lesson = current_user.studentlessons.new
  end

  def create
    @lesson = current_user.studentlessons.new(user_params)
    if @lesson.save
      flash.now[:notice] = "Lesson has been created"
      redirect_to studentlessons_path
    else
      flash[:error] = "Lesson can't be created. There is another lesson at this time."
      render :new
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    flash[:notice] = "Lesson has been destroyed"
    redirect_to studentlessons_path
  end


  private

  def user_params
    params.require(:lesson).permit(:instructor_id, :lesson_time)
  end

end