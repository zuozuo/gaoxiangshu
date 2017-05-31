require 'test_helper'

class AvailibleTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @availible_time = availible_times(:one)
  end

  test "should get index" do
    get availible_times_url
    assert_response :success
  end

  test "should get new" do
    get new_availible_time_url
    assert_response :success
  end

  test "should create availible_time" do
    assert_difference('AvailibleTime.count') do
      post availible_times_url, params: { availible_time: { day: @availible_time.day, end_at: @availible_time.end_at, start_at: @availible_time.start_at } }
    end

    assert_redirected_to availible_time_url(AvailibleTime.last)
  end

  test "should show availible_time" do
    get availible_time_url(@availible_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_availible_time_url(@availible_time)
    assert_response :success
  end

  test "should update availible_time" do
    patch availible_time_url(@availible_time), params: { availible_time: { day: @availible_time.day, end_at: @availible_time.end_at, start_at: @availible_time.start_at } }
    assert_redirected_to availible_time_url(@availible_time)
  end

  test "should destroy availible_time" do
    assert_difference('AvailibleTime.count', -1) do
      delete availible_time_url(@availible_time)
    end

    assert_redirected_to availible_times_url
  end
end
