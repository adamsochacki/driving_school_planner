class UsersController < ApplicationController

  def index
    @lessons = current_user.lessons.all
  end

  def show
    @lessons = current_user.lessons.all
  end

end