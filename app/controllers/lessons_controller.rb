class LessonsController < ApplicationController

  def index
    @lessons = Lessons.all
  end

end