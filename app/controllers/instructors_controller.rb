class InstructorsController < ApplicationController

  def index
    @lessons = current_user.lessons.all
  end

  def show
    @lessons = current_user.lessons.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash.now[:notice] = "Zmodyfikowano"
      redirect_to lessons_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

end