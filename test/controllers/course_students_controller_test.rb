require 'test_helper'

class CourseStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get course_students_create_url
    assert_response :success
  end

  test "should get edit" do
    get course_students_edit_url
    assert_response :success
  end

end
