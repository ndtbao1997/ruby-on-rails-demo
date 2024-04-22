require "test_helper"

class UserRestControllerTest < ActionDispatch::IntegrationTest
  test "should get authenticate" do
    get user_rest_authenticate_url
    assert_response :success
  end
end
