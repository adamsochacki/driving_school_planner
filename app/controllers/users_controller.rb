class UsersController < ApplicationController

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
      flash.now[:notice] = "Modified"
      redirect_to edit_user_path 
      ## poprawić ściężkę po stworzeniu widoku dla wszystkim po tej akcji
    else
      flash[:error] = "Your account has been saved"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

end