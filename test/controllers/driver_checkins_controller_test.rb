require 'test_helper'

class DriverCheckinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver_checkin = driver_checkins(:one)
  end

  test "should get index" do
    get driver_checkins_url
    assert_response :success
  end

  test "should get new" do
    get new_driver_checkin_url
    assert_response :success
  end

  test "should create driver_checkin" do
    assert_difference('DriverCheckin.count') do
      post driver_checkins_url, params: { driver_checkin: { city: @driver_checkin.city, driver_user_id: @driver_checkin.driver_user_id, latitude: @driver_checkin.latitude, longitude: @driver_checkin.longitude, notes: @driver_checkin.notes, state: @driver_checkin.state, status: @driver_checkin.status, street: @driver_checkin.street, zip: @driver_checkin.zip } }
    end

    assert_redirected_to driver_checkin_url(DriverCheckin.last)
  end

  test "should show driver_checkin" do
    get driver_checkin_url(@driver_checkin)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver_checkin_url(@driver_checkin)
    assert_response :success
  end

  test "should update driver_checkin" do
    patch driver_checkin_url(@driver_checkin), params: { driver_checkin: { city: @driver_checkin.city, driver_user_id: @driver_checkin.driver_user_id, latitude: @driver_checkin.latitude, longitude: @driver_checkin.longitude, notes: @driver_checkin.notes, state: @driver_checkin.state, status: @driver_checkin.status, street: @driver_checkin.street, zip: @driver_checkin.zip } }
    assert_redirected_to driver_checkin_url(@driver_checkin)
  end

  test "should destroy driver_checkin" do
    assert_difference('DriverCheckin.count', -1) do
      delete driver_checkin_url(@driver_checkin)
    end

    assert_redirected_to driver_checkins_url
  end
end
