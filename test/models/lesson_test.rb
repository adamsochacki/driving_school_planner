require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "shouldnt accept lesson without student" do
    lesson_without_student = FactoryGirl.build(:lesson, student_id: nil)
    assert !lesson_without_student.valid?
  end

  test "shouldnt accept lesson without instructor" do
    lesson_without_instructor = FactoryGirl.build(:lesson, instructor_id: nil)
    assert !lesson_without_instructor.valid?
  end
end