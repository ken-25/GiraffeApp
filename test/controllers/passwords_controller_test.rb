require 'test_helper'

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get passwords_edit_url
    assert_response :success
  end

end
