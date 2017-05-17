class UsermanagementsController < ApplicationController
  before_action :flag_check

  def flag_check
    if !current_user.is_a_manager && !current_user.is_an_instructor
      redirect_to lessons_path
    elsif !current_user.is_a_manager
      redirect_to instructors_path
    end
  end

  def index
    @users = User.all
    #@usermanagement = users.all
  end

  def show
    @lessons = lessons.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash.now[:notice] = "Użytkownik został zapisany"
      redirect_to usermanagements_path
    else
      flash[:error] = "Nie udało się zapisać użytkownika"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :is_an_instructor)
  end

end