require 'test_helper'

class SmallConcertsControllerTest < ActionController::TestCase
  setup do
    @small_concert = small_concerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:small_concerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create small_concert" do
    assert_difference('SmallConcert.count') do
      post :create, small_concert: { can_edit: @small_concert.can_edit, month: @small_concert.month, year: @small_concert.year }
    end

    assert_redirected_to small_concert_path(assigns(:small_concert))
  end

  test "should show small_concert" do
    get :show, id: @small_concert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @small_concert
    assert_response :success
  end

  test "should update small_concert" do
    patch :update, id: @small_concert, small_concert: { can_edit: @small_concert.can_edit, month: @small_concert.month, year: @small_concert.year }
    assert_redirected_to small_concert_path(assigns(:small_concert))
  end

  test "should destroy small_concert" do
    assert_difference('SmallConcert.count', -1) do
      delete :destroy, id: @small_concert
    end

    assert_redirected_to small_concerts_path
  end
end
