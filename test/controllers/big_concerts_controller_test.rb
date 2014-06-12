require 'test_helper'

class BigConcertsControllerTest < ActionController::TestCase
  setup do
    @big_concert = big_concerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:big_concerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create big_concert" do
    assert_difference('BigConcert.count') do
      post :create, big_concert: { can_edit: @big_concert.can_edit, season: @big_concert.season, year: @big_concert.year }
    end

    assert_redirected_to big_concert_path(assigns(:big_concert))
  end

  test "should show big_concert" do
    get :show, id: @big_concert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @big_concert
    assert_response :success
  end

  test "should update big_concert" do
    patch :update, id: @big_concert, big_concert: { can_edit: @big_concert.can_edit, season: @big_concert.season, year: @big_concert.year }
    assert_redirected_to big_concert_path(assigns(:big_concert))
  end

  test "should destroy big_concert" do
    assert_difference('BigConcert.count', -1) do
      delete :destroy, id: @big_concert
    end

    assert_redirected_to big_concerts_path
  end
end
