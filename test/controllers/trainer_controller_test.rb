require 'test_helper'

class TrainerControllerTest < ActionController::TestCase
  test "should get follow_user" do
    get :follow_user
    assert_response :success
  end

  test "should get follow_network" do
    get :follow_network
    assert_response :success
  end

  test "should get network" do
    get :network
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get teacher" do
    get :teacher
    assert_response :success
  end

  test "should get student" do
    get :student
    assert_response :success
  end

end
