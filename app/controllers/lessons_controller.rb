class LessonsController < ApplicationController

  def index
    @lessons = Lessons.all
  end

  def show
    @lessons = Lessons.all
  end

end