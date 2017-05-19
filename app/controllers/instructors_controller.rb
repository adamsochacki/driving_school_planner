class InstructorsController < ApplicationController

  def index
    @lessons = current_user.lessons.all
  end

  def new
    @lesson = current_user.lessons.new
  end

  def create
    @lesson = current_user.lessons.new(user_params)
    if @lesson.save
      flash.now[:notice] = "Lesson has been created"
      redirect_to lessons_path
    else
      flash[:error] = "Lesson can't be created. There is another lesson at this time."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash.now[:notice] = "Updated successfuly"
      redirect_to lessons_path
    else
      flash[:error] = "Changes cannot be saved"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:student_id, :instructor_id, :lesson_time, :confirmed)
  end

end