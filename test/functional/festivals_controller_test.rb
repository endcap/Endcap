require 'test_helper'

class FestivalsControllerTest < ActionController::TestCase
  setup do
    @festival = festivals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:festivals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create festival" do
    assert_difference('Festival.count') do
      post :create, :festival => @festival.attributes
    end

    assert_redirected_to festival_path(assigns(:festival))
  end

  test "should show festival" do
    get :show, :id => @festival.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @festival.to_param
    assert_response :success
  end

  test "should update festival" do
    put :update, :id => @festival.to_param, :festival => @festival.attributes
    assert_redirected_to festival_path(assigns(:festival))
  end

  test "should destroy festival" do
    assert_difference('Festival.count', -1) do
      delete :destroy, :id => @festival.to_param
    end

    assert_redirected_to festivals_path
  end
end
