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

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex
    if @user.save
      UserMailer.new_user(@user).deliver
      flash.now[:notice] = "User has been created"
      redirect_to usermanagements_path
    else
      flash[:error] = "User cannot be saved"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    UserMailer.deleted_user(user).deliver
    flash[:notice] = "User has been deleted"
    redirect_to usermanagements_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :is_an_instructor)
  end

end