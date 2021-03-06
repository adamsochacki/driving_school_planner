require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  test 'arranged lesson should be unconfirmed' do
    first_unconfirmed_lesson = FactoryGirl.create(:lesson)
    second_unconfirmed_lesson = FactoryGirl.create(:lesson)
    first_confirmed_lesson = FactoryGirl.create(:lesson, confirmed: true)
    second_confirmed_lesson = FactoryGirl.create(:lesson, confirmed: true)

    assert_equal [first_unconfirmed_lesson.id, second_unconfirmed_lesson.id], Lesson.pluck(:id)
  end

  test 'should increment a number of driven hours after arranging a lesson' do
    hrs_driven = Student.find_by
    assert_difference -> { self.hours_driven.count }, 1 do 
      FactoryGirl.create(:lesson)
    end
  end

  test "student must have a name" do
    student_without_name = FactoryGirl.build(:student, name: nil)
    assert !student_without_name.valid?
  end

  test "student must have a surname" do
    student_without_surname = FactoryGirl.build(:student, surname: nil)
    assert !student_without_surname.valid?
  end

end

#