require 'test_helper'

class LogicControllerTest < ActionController::TestCase
  test "should get massHandler" do
    get :massHandler
    assert_response :success
  end

end
