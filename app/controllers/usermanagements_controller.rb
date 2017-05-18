class UsermanagementsController < ApplicationController
  before_action :flag_check

  def flag_check
    if !current_user.is_a_manager && !current_user.is_an_instructor
      redirect_to studentlessons_path
    elsif !current_user.is_a_manager
      redirect_to instructorlessons_path
    end
  end

  def index
    @users = User.where(is_an_instructor: false)
    @instructors = User.where(is_an_instructor: true)
    @lessons = Lesson.where(confirmed: true)
  end

  def show
    @lessons = lessons.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "Użytkownik został zapisany"
      redirect_to usermanagements_path
    else
      flash[:error] = "Nie udało się zapisać użytkownika"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.now[:notice] = "Zmodyfikowano"
      redirect_to root_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "Usunięto użytkownika"
    redirect_to usermanagements_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :is_an_instructor)
  end

end