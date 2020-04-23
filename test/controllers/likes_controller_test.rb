require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get likes_destroy_url
    assert_response :success
  end

end
