require 'test_helper'

class ReviewControllerTest < ActionController::TestCase
  test "should get reviewpage" do
    get :reviewpage
    assert_response :success
  end

end
