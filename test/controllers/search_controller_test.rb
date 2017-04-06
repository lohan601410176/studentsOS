require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get class_find" do
    get search_class_find_url
    assert_response :success
  end

  test "should get student_find" do
    get search_student_find_url
    assert_response :success
  end

  test "should get index" do
    get search_index_url
    assert_response :success
  end

end
