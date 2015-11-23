require 'test_helper'

class TestsControllerTest < ActionController::TestCase
  test "should get home" do
    get :index
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
