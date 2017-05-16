require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do 
    get :index
    get :index, id: 12,
    post :create, lesson: {}
    assert_respone :success
  end
end
