require 'test_helper'

class LessionTimesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lession_times_create_url
    assert_response :success
  end

  test "should get show" do
    get lession_times_show_url
    assert_response :success
  end

  test "should get index" do
    get lession_times_index_url
    assert_response :success
  end

  test "should get edit" do
    get lession_times_edit_url
    assert_response :success
  end

  test "should get update" do
    get lession_times_update_url
    assert_response :success
  end

  test "should get new" do
    get lession_times_new_url
    assert_response :success
  end

end
