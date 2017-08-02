require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get introduce" do
    get :introduce
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get basic_user" do
    get :basic_user
    assert_response :success
  end

  test "should get basic_company" do
    get :basic_company
    assert_response :success
  end

  test "should get request" do
    get :request
    assert_response :success
  end

  test "should get request_confirm" do
    get :request_confirm
    assert_response :success
  end

  test "should get review" do
    get :review
    assert_response :success
  end

  test "should get review_form" do
    get :review_form
    assert_response :success
  end

  test "should get hairshop" do
    get :hairshop
    assert_response :success
  end

  test "should get hairshop_each" do
    get :hairshop_each
    assert_response :success
  end

  test "should get mypage_user" do
    get :mypage_user
    assert_response :success
  end

  test "should get mypage_company" do
    get :mypage_company
    assert_response :success
  end

end
