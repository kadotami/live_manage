require 'test_helper'

class BigConcertBandsControllerTest < ActionController::TestCase
  setup do
    @big_concert_band = big_concert_bands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:big_concert_bands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create big_concert_band" do
    assert_difference('BigConcertBand.count') do
      post :create, big_concert_band: { ba: @big_concert_band.ba, day1: @big_concert_band.day1, day2: @big_concert_band.day2, day3: @big_concert_band.day3, day4: @big_concert_band.day4, description: @big_concert_band.description, dr: @big_concert_band.dr, gt1: @big_concert_band.gt1, gt2: @big_concert_band.gt2, key: @big_concert_band.key, leader: @big_concert_band.leader, name: @big_concert_band.name, season: @big_concert_band.season, vo: @big_concert_band.vo, year: @big_concert_band.year }
    end

    assert_redirected_to big_concert_band_path(assigns(:big_concert_band))
  end

  test "should show big_concert_band" do
    get :show, id: @big_concert_band
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @big_concert_band
    assert_response :success
  end

  test "should update big_concert_band" do
    patch :update, id: @big_concert_band, big_concert_band: { ba: @big_concert_band.ba, day1: @big_concert_band.day1, day2: @big_concert_band.day2, day3: @big_concert_band.day3, day4: @big_concert_band.day4, description: @big_concert_band.description, dr: @big_concert_band.dr, gt1: @big_concert_band.gt1, gt2: @big_concert_band.gt2, key: @big_concert_band.key, leader: @big_concert_band.leader, name: @big_concert_band.name, season: @big_concert_band.season, vo: @big_concert_band.vo, year: @big_concert_band.year }
    assert_redirected_to big_concert_band_path(assigns(:big_concert_band))
  end

  test "should destroy big_concert_band" do
    assert_difference('BigConcertBand.count', -1) do
      delete :destroy, id: @big_concert_band
    end

    assert_redirected_to big_concert_bands_path
  end
end
