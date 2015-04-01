require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :waiting
    assert_response :success
  end

end
