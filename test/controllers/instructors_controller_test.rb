require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do 
    get instructors_url
    assert_response :success
  end
end
