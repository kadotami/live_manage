require 'test_helper'

class SmallConcertBandsControllerTest < ActionController::TestCase
  setup do
    @small_concert_band = small_concert_bands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:small_concert_bands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create small_concert_band" do
    assert_difference('SmallConcertBand.count') do
      post :create, small_concert_band: { ba: @small_concert_band.ba, description: @small_concert_band.description, dr: @small_concert_band.dr, gt1: @small_concert_band.gt1, gt2: @small_concert_band.gt2, key: @small_concert_band.key, leader: @small_concert_band.leader, month: @small_concert_band.month, name: @small_concert_band.name, song: @small_concert_band.song, vo: @small_concert_band.vo, week1: @small_concert_band.week1, week2: @small_concert_band.week2, year: @small_concert_band.year }
    end

    assert_redirected_to small_concert_band_path(assigns(:small_concert_band))
  end

  test "should show small_concert_band" do
    get :show, id: @small_concert_band
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @small_concert_band
    assert_response :success
  end

  test "should update small_concert_band" do
    patch :update, id: @small_concert_band, small_concert_band: { ba: @small_concert_band.ba, description: @small_concert_band.description, dr: @small_concert_band.dr, gt1: @small_concert_band.gt1, gt2: @small_concert_band.gt2, key: @small_concert_band.key, leader: @small_concert_band.leader, month: @small_concert_band.month, name: @small_concert_band.name, song: @small_concert_band.song, vo: @small_concert_band.vo, week1: @small_concert_band.week1, week2: @small_concert_band.week2, year: @small_concert_band.year }
    assert_redirected_to small_concert_band_path(assigns(:small_concert_band))
  end

  test "should destroy small_concert_band" do
    assert_difference('SmallConcertBand.count', -1) do
      delete :destroy, id: @small_concert_band
    end

    assert_redirected_to small_concert_bands_path
  end
end
