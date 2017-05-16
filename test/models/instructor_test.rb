require 'test_helper'

class InstructorTest < ActiveSupport::TestCase

  test "should be able to arrange a lesson" do
    confirmed_lesson = FactoryGirl.create(:lesson, confirmed: true)
    assert confirmed_lesson
  end

  test "instructor must have a name" do
    instructor_without_name = FactoryGirl.build(:instructor, name: nil)
    assert !instructor_without_name.valid?
  end

  test "instructor must have a surname" do
    instructor_without_surname = FactoryGirl.build(:instructor, surname: nil)
    assert !instructor_without_surname.valid?
  end

end
