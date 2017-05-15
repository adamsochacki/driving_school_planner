FactoryGirl.define do
  factory :lesson do
    lesson_time DateTime.new(2017, 12, 05, 16, 00, 00)
    confirmed false
    student_id 10
    instructor_id 5
  end
end

