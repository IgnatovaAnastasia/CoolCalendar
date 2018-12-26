require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get user_register_url
    assert_response :success
  end

  test "should get auth" do
    get user_auth_url
    assert_response :success
  end

end
