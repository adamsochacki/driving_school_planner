require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do 
    get students_url
    assert_response :success
  end
end
