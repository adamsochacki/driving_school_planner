require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do 
    get lessons_url
    assert_response :success
  end

  test "should create lesson" do
    assert_difference('lessons.count') do
      post lessons_url, params: { lesson: { student_id: 1, instructor_id: 2, lesson_time: "2017-05-20 18:00:00", confirmed: false } }
    end
 
    assert_redirected_to lessons_path(Lesson.last)
  end
end